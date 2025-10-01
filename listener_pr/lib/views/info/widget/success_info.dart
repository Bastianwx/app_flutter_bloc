import 'package:flutter/material.dart';
import '../../../model/info.dart';

class SuccessInfo extends StatelessWidget {
  final Info info;
  const SuccessInfo({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Nombre: ${info.name}", style: const TextStyle(fontSize: 20)),
          Text("Correo: ${info.email}"),
        ],
      ),
    );
  }
}
