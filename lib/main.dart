import 'package:flutter/material.dart';

import 'homePage.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: "/home",
      theme:ThemeData( primarySwatch: Colors.grey, inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Color(0xFFE3E3E3),
      ),),
      routes: {

        "/home": (BuildContext context)=> const Homepage()

      },
    );
  }
}
