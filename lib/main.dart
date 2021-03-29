import 'package:flutter/material.dart';
import 'file:///D:/projects/leieren_flutter/lib/page/card_stack_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leieren',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CardStackPage(),
    );
  }
}