import 'dart:io';

import 'package:flutter/material.dart';
import 'package:loginpage/login_screen/LoginScreen.dart';

import 'MyHttpOverrides.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
    );
  }
}


