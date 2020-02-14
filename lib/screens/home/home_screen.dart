import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_list_flutter/lang/index.dart';
import 'package:the_movie_list_flutter/repository/index.dart';
import 'package:the_movie_list_flutter/screens/home/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RepositoryExecutor repositoryExecutor =
            RepositoryExecutor(context: context);
    var movieRepository = MovieRepository(repositoryExecutor);
    return BlocProvider<HomeBloc>(
        create: (context) {
          return HomeBloc(movieRepository: movieRepository)
          ..add(HomeEventStart());
        },
        child: HomeContent());
  }
}