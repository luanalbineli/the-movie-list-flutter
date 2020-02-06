import 'package:bloc/bloc.dart';
import 'package:the_movie_list_flutter/screens/index.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  @override
  get initialState => MainStateInitial();

  @override
  Stream<MainState> mapEventToState(event) async* {
    if (event is MainEventTabChanged) {
      yield MainStateTabChanged(menuType: event.menuType);
    }
  }
}