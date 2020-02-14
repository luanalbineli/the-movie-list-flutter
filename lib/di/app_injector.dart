import 'package:inject/inject.dart';
import 'package:the_movie_list_flutter/main.dart';

@Injector()
abstract class AppInjector {
  @provide
  App app;
}