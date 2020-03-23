import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie_list_flutter/bloc/index.dart';
import 'package:the_movie_list_flutter/lang/app_localizations.dart';
import 'package:the_movie_list_flutter/routes/index.dart';
import 'package:the_movie_list_flutter/screens/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

import 'repository/index.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  App();

  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> {
  @override
  void initState() {
    super.initState();
    final getIt = GetIt.I;

    final repositoryExecutor = RepositoryExecutor();
    final dbRepository = DbRepository();
    getIt.registerSingleton(repositoryExecutor);
    getIt.registerSingleton(CommonRepository(repositoryExecutor));
    getIt.registerSingleton(MovieRepository(
        repositoryExecutor: repositoryExecutor, dbRepository: dbRepository));
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, WidgetBuilder> appRoutes = AppRoutes.getRoutes();
    final commonRepository = GetIt.I<CommonRepository>();

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
              return AppBloc(commonRepository: commonRepository)
                ..add(AppEventStart());
            },
            child: SplashScreen()));
  }
}
