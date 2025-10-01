import 'package:equatable/equatable.dart';

abstract class InfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadInfo extends InfoEvent {}
