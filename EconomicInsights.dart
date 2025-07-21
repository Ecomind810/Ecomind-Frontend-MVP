import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EconomicInsights extends StatefulWidget {
  @override
  _EconomicInsightsState createState() => _EconomicInsightsState();
}

class _EconomicInsightsState extends State<EconomicInsights> {
  double current = 120.0;
  double newCost = 90.0;
  Map? result;

  void analyze() async {
    final res = await http.post(
      Uri.parse("http://localhost:8000/economic/analyze"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"current": current, "new": newCost}),
    );
    setState(() {
      result = jsonDecode(res.body);
    });
  }

  @override
  void initState() {
    super.initState();
    analyze();
  }

  @override
  Widget build(BuildContext context) {
    return result == null
        ? CircularProgressIndicator()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Monthly Savings: \$${result!["monthly_savings"]}"),
              Text("Yearly Savings: \$${result!["yearly_savings"]}"),
              Text("ROI: ${result!["roi_percent"]}%"),
            ],
          );
  }
}