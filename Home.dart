import 'package:flutter/material.dart';
import '../components/Dashboard.dart';
import '../components/CarbonTracker.dart';
import '../components/EconomicInsights.dart';
import '../components/CoachChat.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final habits = ModalRoute.of(context)!.settings.arguments as Map;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("EcoMind Dashboard"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Summary"),
              Tab(text: "Carbon"),
              Tab(text: "Economics"),
              Tab(text: "Coach"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Dashboard(habits: habits),
            CarbonTracker(habits: habits),
            EconomicInsights(),
            CoachChat(habits: habits),
          ],
        ),
      ),
    );
  }
}