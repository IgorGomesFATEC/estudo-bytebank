import 'package:bytebank/components/transaction_auth_dialog.dart';
import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
  // save(Transaction(1000, Contact(0, 'Roger', 1002)));
  // findAll().then((transactions) => print('new transactions $transactions'));
}

class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        colorScheme:  ThemeData().colorScheme.copyWith(
          secondary: Colors.blueAccent[700],
          primary: Colors.green[900],
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
      // home: transaction_auth_dialog(),
    );
  }
}
