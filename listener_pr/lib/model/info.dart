import 'package:equatable/equatable.dart';

class Info extends Equatable {
  final String id;
  final String? name;
  final String? username;
  final String? email;

  const Info({
    required this.id,
    this.name,
    this.username,
    this.email,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json['id']?.toString() ?? '',
        name: json['name'],
        username: json['username'],
        email: json['email'],
      );

  @override
  List<Object?> get props => [id, name, username, email];
}
