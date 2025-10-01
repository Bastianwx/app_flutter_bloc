import 'package:flutter/material.dart';

class FailedLogin extends StatelessWidget {
  final String message;
  const FailedLogin({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Error: $message", style: const TextStyle(color: Colors.red)));
  }
}
