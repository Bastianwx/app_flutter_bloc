import '../model/info.dart';

class ApiService {
  String? _loggedName;
  String? _loggedEmail;
  String? _loggedPassword;

  Future<bool> login(String name, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      _loggedName = name;
      _loggedEmail = email;
      _loggedPassword = password;
      return true;
    }
    return false;
  }

  Future<Info> fetchInfo() async {
    await Future.delayed(const Duration(seconds: 2));

    return Info(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _loggedName ?? "Sin nombre",
      username: _loggedEmail?.split("@").first ?? "guest",
      email: _loggedEmail ?? "desconocido@test.com",
    );
  }
}
