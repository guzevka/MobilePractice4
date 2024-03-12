import 'package:flutter/material.dart';
import 'package:flutter_4/form_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: form_1(),
      debugShowCheckedModeBanner: false
    );
  }
}