import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppEventStart extends AppEvent {}

class AppEventConfigLoaded extends AppEvent {}

class AppEventConfigError extends AppEvent {}