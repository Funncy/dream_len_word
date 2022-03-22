import 'package:flutter/material.dart';
import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '사순절 말씀 카드 뽑기',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(child: MainPage()),
    );
  }
}
