import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {

  final Function(String password) onConfirm;

  TransactionAuthDialog({@required this.onConfirm});

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authentication'),
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        style: TextStyle(fontSize: 64,letterSpacing: 24),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            print('Cancel');
          },
        ),
        TextButton(
          child: Text('Confirm'),
          onPressed: () {
            widget.onConfirm(_passwordController.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}