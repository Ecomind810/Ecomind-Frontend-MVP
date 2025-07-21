import 'package:flutter/material.dart';
class Dashboard extends StatelessWidget {
  final Map habits;
  Dashboard({required this.habits});
  @override
  Widget build(BuildContext context) =>
    Center(child: Text('Welcome to EcoMind!'));
}