import 'package:flutter/material.dart';

import 'views/1-login.dart';



void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMIZANIA',
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}
