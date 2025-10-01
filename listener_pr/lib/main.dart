import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services/api_service.dart';
import 'views/login/bloc/login_bloc.dart';
import 'pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Listener Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => LoginBloc(ApiService()),
        child: LoginPage(),
      ),
    );
  }
}
