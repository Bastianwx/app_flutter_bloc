import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/app_bloc.dart';
import '../bloc/app_event.dart';
import '../bloc/app_state.dart';
import '../views/loading_view.dart';
import '../views/success_view.dart';
import '../views/failure_view.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo BLoC")),
      body: Center(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            if (state is AppInitial) {
              return ElevatedButton(
                onPressed: () {
                  context.read<AppBloc>().add(LoadDataEvent());
                },
                child: const Text("Cargar datos"),
              );
            } else if (state is AppLoading) {
              return const LoadingView();
            } else if (state is AppSuccess) {
              return const SuccessView();
            } else if (state is AppFailure) {
              return const FailureView();
            }
            return const Text("Estado desconocido");
          },
        ),
      ),
    );
  }
}
