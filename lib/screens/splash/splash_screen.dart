import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_list_flutter/bloc/index.dart';
import 'package:the_movie_list_flutter/routes/index.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      child: Text('Loaded'),
      listener: (context, state) async {
        final NavigatorState navigator = Navigator.of(context);
        if (state is AppStateSuccess) {
          navigator.pushReplacementNamed(AppRoutes.home.key);
        }
      }
    );
  }
}