import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../views/info/bloc/info_bloc.dart';
import '../views/info/bloc/info_event.dart';
import '../views/info/bloc/info_state.dart';
import '../services/api_service.dart';

class HomePage extends StatelessWidget {
  final ApiService apiService;

  const HomePage({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InfoBloc(apiService)..add(LoadInfo()),
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          title: const Text("Inicio"),
          backgroundColor: Colors.blue.shade600,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocBuilder<InfoBloc, InfoState>(
          builder: (context, state) {
            if (state is InfoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is InfoLoaded) {
              return Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,
                  margin: const EdgeInsets.all(24),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.account_circle,
                            size: 100, color: Colors.blue.shade400),
                        const SizedBox(height: 20),
                        Text(
                          "Bienvenido, ${state.info.name ?? 'Sin nombre'}",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue.shade700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Usuario: ${state.info.username ?? 'Invitado'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          "Correo: ${state.info.email ?? 'desconocido@test.com'}",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is InfoError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
