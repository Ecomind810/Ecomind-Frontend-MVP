import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CarbonTracker extends StatefulWidget {
  final Map habits;
  CarbonTracker({required this.habits});

  @override
  _CarbonTrackerState createState() => _CarbonTrackerState();
}

class _CarbonTrackerState extends State<CarbonTracker> {
  double? footprint;

  Future<void> fetchFootprint() async {
    final res = await http.post(
      Uri.parse("http://localhost:8000/carbon/estimate"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(widget.habits),
    );
    final data = jsonDecode(res.body);
    setState(() {
      footprint = data["carbon_footprint_kg"];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchFootprint();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: footprint == null
          ? CircularProgressIndicator()
          : Text("Estimated monthly footprint: \$footprint kg CO₂e"),
    );
  }
}