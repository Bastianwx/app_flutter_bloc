import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../../services/api_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService apiService;

  LoginBloc(this.apiService) : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      final success = await apiService.login(event.name, event.email, event.password);
      if (success) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure(error: "Credenciales inválidas"));
      }
    });
  }
}
