import 'package:flutter/material.dart';
import 'screens/ProfileSetup.dart';
import 'screens/Home.dart';

void main() {
  runApp(EcoMindApp());
}

class EcoMindApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoMind',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => ProfileSetupScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}