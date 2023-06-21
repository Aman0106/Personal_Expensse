import 'package:flutter/material.dart';

import './models/transaction.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personaal Expense',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.red),
        fontFamily: 'RobotoSlab',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final String title;
  final List<Transaction> _transactions = [
    Transaction(
      id: "t1",
      title: "Burger",
      amount: 30,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Bullets",
      amount: 20,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t1",
      title: "Half Burger",
      amount: 95,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t1",
      title: "Bus",
      amount: 95,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final txn = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _transactions.add(txn);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bctx) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personel Expenses"),
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: Colors.blue,
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                child: const Text("Chart!! "),
              ),
            ),
            TransactionsList(_transactions),
          ],
        ),
      ),
    );
  }
}
