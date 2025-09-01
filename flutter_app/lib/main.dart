import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/bloc/app_bloc.dart';
import 'feature/pages/app_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "App prueba",
        home: AppPage(),
      ),
    );
  }
}
