import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(Uri.parse(url));
    final List<dynamic> decodeJSON = jsonDecode(response.body);
    return decodeJSON
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJSON = jsonEncode(transaction.toJson());
    final Response response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json', 'password': password},
      body: transactionJSON,
    );

    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }

    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponses.containsKey(statusCode)) {
      return _statusCodeResponses[statusCode];
    }
    return 'Unknown error';
  }

  static final Map<int, String> _statusCodeResponses = {
    400: 'there was an error: submitting transaction',
    401: 'authenticate failed',
    409: 'transaction already exists',
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
