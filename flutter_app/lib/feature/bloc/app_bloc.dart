import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_event.dart';
import 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<LoadDataEvent>((event, emit) async {
      emit(AppLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(AppSuccess());
    });

    on<SuccessEvent>((event, emit) => emit(AppSuccess()));

    on<FailureEvent>((event, emit) => emit(AppFailure()));
  }
}
