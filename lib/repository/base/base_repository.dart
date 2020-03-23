import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/repository/base/repository_executor.dart';

abstract class BaseRepository {
  final RepositoryExecutor repositoryExecutor;

  BaseRepository(this.repositoryExecutor) : assert(repositoryExecutor != null);

  @protected
  List<T> parseListFromJsonResponse<T>(Map<String, dynamic> jsonResponse,
      String key, T parser(dynamic jsonItem)) {
    List<dynamic> jsonList = jsonResponse[key];
    return jsonList.map(parser).toList();
  }

  static const initialPageIndex = 1;
}
