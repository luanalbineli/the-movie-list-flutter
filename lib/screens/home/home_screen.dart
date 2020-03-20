import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie_list_flutter/repository/index.dart';
import 'package:the_movie_list_flutter/screens/home/index.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieRepository = GetIt.I<MovieRepository>();
    return BlocProvider<HomeBloc>(
        create: (context) {
          return HomeBloc(movieRepository: movieRepository)
            ..add(HomeEventStart());
        },
        child: HomeContent());
  }
}
