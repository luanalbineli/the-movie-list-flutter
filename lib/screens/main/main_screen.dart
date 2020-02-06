import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_list_flutter/screens/index.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainBloc>(
        create: (context) {
          return MainBloc();
        },
        child: MainContent());
  }
}
