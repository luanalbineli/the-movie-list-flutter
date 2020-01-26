import 'package:bloc/bloc.dart';
import 'package:the_movie_list_flutter/bloc/index.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  @override
  AppState get initialState => AppInitialState();

  @override
  Stream<AppState> mapEventToState(AppEvent event) {
    if (event is AppEventStart) {
      
    }
    return null;
  }

}