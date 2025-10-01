import 'package:flutter/material.dart';

class InitialLogin extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;

  const InitialLogin({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(controller: emailController, decoration: const InputDecoration(labelText: "Correo")),
        TextField(controller: passwordController, obscureText: true, decoration: const InputDecoration(labelText: "Contraseña")),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: onLogin, child: const Text("Ingresar")),
      ],
    );
  }
}
