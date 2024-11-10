import 'package:flutter/material.dart';
import 'package:vinyl_shop/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vinyl Shop',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.cyan,
        ).copyWith(secondary: Colors.cyan[800]),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

