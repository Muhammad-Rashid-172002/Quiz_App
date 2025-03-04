import 'package:flutter/material.dart';
import 'package:quiz_app/home/home.dart';
import 'package:quiz_app/home/splasscreen.dart';
import 'package:quiz_app/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splasscreen()
        //Login()
        //Home(),
        );
  }
}
