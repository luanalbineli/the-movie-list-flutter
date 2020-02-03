import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:the_movie_list_flutter/bloc/index.dart';
import 'package:the_movie_list_flutter/lang/app_localizations.dart';
import 'package:the_movie_list_flutter/routes/index.dart';
import 'package:the_movie_list_flutter/screens/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

import 'repository/index.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App();

  @override
  Widget build(BuildContext context) {
    Map<String, WidgetBuilder> appRoutes = AppRoutes.getRoutes();

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
        routes: appRoutes,
        home: BlocProvider<AppBloc>(
      create: (context) {
        RepositoryExecutor repositoryExecutor =
            RepositoryExecutor(context: context);
        CommonRepository commonRepository =
            CommonRepository(repositoryExecutor);
        return AppBloc(commonRepository)..add(AppEventStart());
      },
      child: SplashScreen()));
  }
}
