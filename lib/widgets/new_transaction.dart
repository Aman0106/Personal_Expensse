import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function _addTransaction;

  void addTransaction(BuildContext context) {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    _addTransaction(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => addTransaction(context),
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => addTransaction(context),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2),
                ),
                labelText: "Amount",
              ),
            ),
            ElevatedButton(
              onPressed: () => addTransaction(context),
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
