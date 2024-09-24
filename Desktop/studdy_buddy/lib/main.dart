import 'package:flutter/material.dart';
import 'package:studdy_buddy/Screen/home.dart';
 


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: 'Flutter Demo',
      home: homescreen(),
    );
  }
}



