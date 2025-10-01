import 'package:flutter_bloc/flutter_bloc.dart';
import 'info_event.dart';
import 'info_state.dart';
import '../../../services/api_service.dart';

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  final ApiService apiService;

  InfoBloc(this.apiService) : super(InfoInitial()) {
    on<LoadInfo>((event, emit) async {
      emit(InfoLoading());
      try {
        final info = await apiService.fetchInfo();
        emit(InfoLoaded(info));
      } catch (e) {
        emit(InfoError("Error al cargar la información"));
      }
    });
  }
}
