import 'package:flutter/material.dart';
import 'package:take_picture/homescreen.dart';
void main() {
  runApp(const MyApp());
}
 
class MyApp  extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Take Picture',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
    ),
    home: const homescreen(title: 'Take Picture'),
    );
  }
}