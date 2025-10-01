import 'package:flutter/material.dart';

class FailedInfo extends StatelessWidget {
  final String message;
  const FailedInfo({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Error: $message", style: TextStyle(color: Colors.red)));
  }
}
