import 'package:flutter/material.dart';

class LoadingLogin extends StatelessWidget {
  const LoadingLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
