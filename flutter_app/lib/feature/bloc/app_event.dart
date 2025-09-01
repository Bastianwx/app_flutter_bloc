import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class LoadDataEvent extends AppEvent {}

class SuccessEvent extends AppEvent {}

class FailureEvent extends AppEvent {}
