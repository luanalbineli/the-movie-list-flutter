import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_movie_list_flutter/bloc/index.dart';
import 'package:the_movie_list_flutter/lang/app_localizations.dart';
import 'package:the_movie_list_flutter/screens/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

void main() {
  runApp(BlocProvider<AppBloc>(
    create: (context) {
      return AppBloc()
        ..add(AppEventStart());
    },
    child: App()));
}

class App extends StatelessWidget {
  App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'The Movie List App',
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
