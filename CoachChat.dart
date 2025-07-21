import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CoachChat extends StatefulWidget {
  final Map habits;
  CoachChat({required this.habits});

  @override
  _CoachChatState createState() => _CoachChatState();
}

class _CoachChatState extends State<CoachChat> {
  final controller = TextEditingController();
  String response = "";

  void askCoach(String query) async {
    final res = await http.post(
      Uri.parse("http://localhost:8000/coach/ask"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"query": query, "context": {"habits": widget.habits, "location": "unknown"}}),
    );
    setState(() {
      response = jsonDecode(res.body)["response"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: "Ask the coach something..."),
        ),
        ElevatedButton(
          onPressed: () => askCoach(controller.text),
          child: Text("Send"),
        ),
        SizedBox(height: 20),
        Text(response),
      ],
    );
  }
}