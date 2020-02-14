import 'package:the_movie_list_flutter/repository/base/base_repository.dart';
import 'package:the_movie_list_flutter/repository/base/repository_executor.dart';
import 'package:the_movie_list_flutter/util/index.dart';
import 'package:the_movie_list_flutter/model/index.dart';

class MovieRepository extends BaseRepository {
  MovieRepository(RepositoryExecutor repositoryExecutor)
      : super(repositoryExecutor);

  Future<List<MovieResponseModel>> getTopRatedMovieList(
      {int pageIndex = BaseRepository.initialPageIndex}) async {
    var queryParams = {'page': pageIndex};

    Map<String, dynamic> jsonResponse = await repositoryExecutor
        .getAsJsonObject(Url.movieTopRated, queryParams: queryParams);

    return parseListFromJsonResponse(jsonResponse, 'results',
        (jsonItem) => MovieResponseModel.fromJson(jsonItem));
  }

  Future<List<MovieResponseModel>> getPopularMovieList(
      {int pageIndex = BaseRepository.initialPageIndex}) async {
    var queryParams = {'page': pageIndex};

    Map<String, dynamic> jsonResponse = await repositoryExecutor
        .getAsJsonObject(Url.moviePopular, queryParams: queryParams);

    return parseListFromJsonResponse(jsonResponse, 'results',
        (jsonItem) => MovieResponseModel.fromJson(jsonItem));
  }
}
