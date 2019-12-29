import 'package:bloc/bloc.dart';
import 'package:the_movie_list_flutter/bloc/splash/splash_event.dart';
import 'package:the_movie_list_flutter/bloc/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  @override
  SplashState get initialState => SplashUninitialized();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) {
    // TODO: implement mapEventToState
    return null;
  }

}