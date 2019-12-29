import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashUninitialized extends SplashState {}

class SplashConfigurationLoaded extends SplashState {}

class SplashConfigurationNotLoaded  extends SplashState {}