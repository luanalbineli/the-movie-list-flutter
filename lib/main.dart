import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_movie_list_flutter/bloc/splash/splash_bloc.dart';
import 'package:the_movie_list_flutter/bloc/splash/splash_event.dart';
import 'package:the_movie_list_flutter/lang/app_localizations.dart';
import 'package:the_movie_list_flutter/screens/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

void main() {
  runApp(BlocProvider<SplashBloc>(
    create: (context) {
      return SplashBloc()
        ..add(StartApp());
    },
    child: App()));
}

class App extends StatelessWidget {
  App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Code Money Sales App',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate
        ],
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        theme: AppTheme.getTheme(context),
        home: SplashScreen());
  }
}
