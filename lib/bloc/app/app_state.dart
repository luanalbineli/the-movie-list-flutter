import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/model/index.dart';

abstract class AppState extends Equatable {
  final ConfigurationResponseModel configurationModel;
  AppState({ @required this.configurationModel });
  @override
  List<Object> get props => [configurationModel];
}

class AppInitialState extends AppState {}

class AppConfigurationLoaded extends AppState {}

class AppConfigurationNotLoaded  extends AppState {}