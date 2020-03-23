import 'package:the_movie_list_flutter/model/index.dart';

import 'db_provider.dart';

class DbRepository {
  Future<Map<int, MovieStatusModel>> getWatchedFavoriteMovieList() async {
    try {
      final db = await DBProvider.db.database;
      List<Map<String, dynamic>> result = await db.rawQuery(
          'SELECT id, is_favorite, is_watched FROM ${DBProvider.tableNameMovie}');
      return Map.fromIterable(result,
          key: (element) => element['id'],
          value: (element) => MovieStatusModel(
              isFavorite: element['is_favorite'],
              isWatched: element['is_watched']));
    } catch (exception) {
      print('An error occurred: $exception');
      throw exception;
    }
  }
}
