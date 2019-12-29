import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_list_flutter/bloc/splash/splash_state.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      child: SplashScreen(),
      listener: (context, state) async {
        final NavigatorState navigator = Navigator.of(context);

        if (state is SplashConfigurationLoaded) {
        }

        if (state is SplashConfigurationNotLoaded) {
        }
      }
    );
  }
}