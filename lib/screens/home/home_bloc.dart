import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/model/index.dart';
import 'package:the_movie_list_flutter/repository/index.dart';
import 'package:the_movie_list_flutter/screens/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MovieRepository movieRepository;

  HomeBloc({@required this.movieRepository});

  @override
  HomeState get initialState => HomeStateInitial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeEventStart) {
      yield* _fetchMovieList();
    }
  }

  Stream<HomeState> _fetchMovieList() async* {
    yield HomeStateLoading();

    try {
      List<MovieResponseModel> topRatedMovieList =
          await movieRepository.getTopRatedMovieList();
      List<MovieResponseModel> popularMovieList =
          await movieRepository.getPopularMovieList();

      yield HomeStateSuccess(
          topRatedMovieList: topRatedMovieList,
          popularMovieList: popularMovieList);
    } catch (exception) {
      print(exception);
      yield HomeStateError(exception);
    }
  }
}
