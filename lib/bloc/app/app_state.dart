import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/model/index.dart';

abstract class AppState extends Equatable {
  final ConfigurationResponseModel configurationModel;
  final List<GenreResponseModel> genreListModel;
  AppState({@required this.configurationModel, @required this.genreListModel});
  @override
  List<Object> get props => [configurationModel, genreListModel];
}

class AppStateInitial extends AppState {}

class AppStateLoading extends AppState {}

class AppStateSuccess extends AppState {
  AppStateSuccess(
      {@required ConfigurationResponseModel configurationModel,
      @required List<GenreResponseModel> genreListModel})
      : super(
            configurationModel: configurationModel,
            genreListModel: genreListModel);
}

class AppStateError extends AppState {
  final dynamic exception;
  AppStateError({@required this.exception});
}
