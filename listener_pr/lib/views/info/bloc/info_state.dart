import 'package:equatable/equatable.dart';
import '../../../model/info.dart';

abstract class InfoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InfoInitial extends InfoState {}

class InfoLoading extends InfoState {}

class InfoLoaded extends InfoState {
  final Info info;

  InfoLoaded(this.info);

  @override
  List<Object?> get props => [info];
}

class InfoError extends InfoState {
  final String message;
  InfoError(this.message);

  @override
  List<Object?> get props => [message];
}
