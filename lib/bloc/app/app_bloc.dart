import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/bloc/index.dart';
import 'package:the_movie_list_flutter/repository/index.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final CommonRepository commonRepository;
  AppBloc({ @required this.commonRepository });

  @override
  AppState get initialState => AppStateInitial();

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is AppEventStart) {
      yield* _cacheCommonData();
    }
  }

  Stream<AppState> _cacheCommonData() async* {
    try {
      yield AppStateLoading();
      List<Future<dynamic>> commonDataList = [
        commonRepository.getConfiguration(),
        commonRepository.getGenreList()
      ];

      List<dynamic> responseList = await Future.wait(commonDataList);
      yield AppStateSuccess(
          configurationModel: responseList[0], genreListModel: responseList[1]);
    } catch (exception) {
      print('Error: $exception');
      yield AppStateError(exception: exception);
    }
  }
}
