import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function _addTransaction;

  NewTransaction(this._addTransaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                ),
                labelText: "Title",
              ),
              controller: titleController,
            ),
            SizedBox(height: 15,),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                ),
                labelText: "Amount",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _addTransaction(
                  titleController.text,
                  double.parse(amountController.text),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
