import 'dart:convert';

import 'package:chang05/transaction_consumer_provider/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class TransactionProvider with ChangeNotifier {
  /* ตัวอย่างข้อมูล */
  List<Transaction> transactions = [];
/* ดึงข้อมูล */
  List<Transaction> getTracsaction() {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    transactions.add(statement);
    /* แจ้งเตือน Consumer */
    notifyListeners();
  }

  List<Transactiont> transactionst = [];
  void addTransactiont(Transactiont statement) {
    transactionst.add(statement);
    /* แจ้งเตือน Consumer */
    notifyListeners();
  }

  List<Usertransaction> usert = [];
  void usertransaction(Usertransaction statement) {
    usert.add(statement);
    notifyListeners();
  }
}

class UserProvider with ChangeNotifier {
  String? id;
  String? username;
  String? firstname;
  String? lastname;
  String? email;
  String? ayer;
  String? datetime;
  String? line;
  String? numphon;
  String? facebook;
  String? address;
}

class Post with ChangeNotifier {
  String? text;
  String? time;
  String? am;
  String? number;
  String? line;
}
