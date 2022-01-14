import 'package:avodha_moke/screens/homePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff0a0e21)),
        scaffoldBackgroundColor: const Color(0xff0a0e21),
      ),
      home: const HomePage(),
    );
  }
}
