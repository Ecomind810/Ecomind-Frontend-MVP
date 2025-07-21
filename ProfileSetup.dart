import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final habits = {
    "transport_mode": "car",
    "weekly_km": 0.0,
    "energy_source": "coal",
    "monthly_kwh": 0.0,
    "diet_type": "omnivore",
    "shopping_expense": 0.0
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setup Your Profile")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text("Transport Mode"),
            DropdownButtonFormField(
              value: habits["transport_mode"],
              onChanged: (val) => setState(() => habits["transport_mode"] = val),
              items: ["car", "bus", "bike", "walk", "train"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Weekly KM"),
              keyboardType: TextInputType.number,
              onChanged: (val) => habits["weekly_km"] = double.tryParse(val) ?? 0,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Monthly kWh"),
              keyboardType: TextInputType.number,
              onChanged: (val) => habits["monthly_kwh"] = double.tryParse(val) ?? 0,
            ),
            Text("Energy Source"),
            DropdownButtonFormField(
              value: habits["energy_source"],
              onChanged: (val) => setState(() => habits["energy_source"] = val),
              items: ["coal", "natural_gas", "solar", "wind"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: "Monthly Shopping Expense (\$)"),
              keyboardType: TextInputType.number,
              onChanged: (val) => habits["shopping_expense"] = double.tryParse(val) ?? 0,
            ),
            Text("Diet"),
            DropdownButtonFormField(
              value: habits["diet_type"],
              onChanged: (val) => setState(() => habits["diet_type"] = val),
              items: ["omnivore", "vegetarian", "vegan"]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home', arguments: habits);
              },
              child: Text("Continue"),
            )
          ],
        ),
      ),
    );
  }
}