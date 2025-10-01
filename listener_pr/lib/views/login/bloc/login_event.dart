import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final String name;
  final String email;
  final String password;

  LoginSubmitted({required this.name, required this.email, required this.password});

  @override
  List<Object?> get props => [name, email, password];
}
