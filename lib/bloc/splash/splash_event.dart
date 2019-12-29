import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();

  @override
  List<Object> get props => [];
}

class StartApp extends SplashEvent {}

class ConfigurationLoaded extends SplashEvent {}

class ConfigurationNotLoaded extends SplashEvent {}