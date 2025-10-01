import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../views/login/bloc/login_bloc.dart';
import '../views/login/bloc/login_event.dart';
import '../views/login/bloc/login_state.dart';
import 'home.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            final apiService = context.read<LoginBloc>().apiService;
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomePage(apiService: apiService),
              ),
            );
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          if (state is LoginLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                elevation: 10,
                shadowColor: Colors.blue.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Iniciar Sesión",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade700,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Campo Nombre
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Nombre",
                          prefixIcon: const Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Campo Email
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Email",
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Campo Contraseña
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Contraseña",
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Botón de login
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade600,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  LoginSubmitted(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          },
                          child: const Text(
                            "Iniciar sesión",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
