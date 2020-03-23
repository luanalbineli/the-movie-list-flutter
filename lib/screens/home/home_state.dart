import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/model/index.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateError extends HomeState {
  final dynamic exception;

  HomeStateError(this.exception);
}

class HomeStateSuccess extends HomeState {
  final List<MovieModel> topRatedMovieList;
  final List<MovieModel> popularMovieList;

  HomeStateSuccess(
      {@required this.topRatedMovieList, @required this.popularMovieList});

  @override
  List<Object> get props => [topRatedMovieList, popularMovieList];
}
