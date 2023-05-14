import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
    print("added");
    setState(() {
      _transactions.add(txn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionsList(_transactions),
      ],
    );
  }
}
