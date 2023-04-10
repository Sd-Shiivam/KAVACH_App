import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void callbackDispatcher() {
  print("hello");
}

void main() => {
      runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Home())),
    };
