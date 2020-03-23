import 'package:get_it/get_it.dart';
import 'package:the_movie_list_flutter/model/index.dart';
import 'package:the_movie_list_flutter/repository/index.dart';
import 'package:the_movie_list_flutter/util/index.dart';

class MovieRepository extends BaseRepository {
  final DbRepository dbRepository;

  MovieRepository({RepositoryExecutor repositoryExecutor, this.dbRepository})
      : super(repositoryExecutor);

  Future<List<MovieModel>> getTopRatedMovieList(
      {int pageIndex = BaseRepository.initialPageIndex}) async {
    var queryParams = {'page': pageIndex};

    Map<String, dynamic> jsonResponse = await repositoryExecutor
        .getAsJsonObject(Url.movieTopRated, queryParams: queryParams);

    final movieResponseListModel = parseListFromJsonResponse(jsonResponse,
        'results', (jsonItem) => MovieResponseModel.fromJson(jsonItem));

    return parseToMovieListModel(movieResponseListModel);
  }

  Future<List<MovieModel>> getPopularMovieList(
      {int pageIndex = BaseRepository.initialPageIndex}) async {
    var queryParams = {'page': pageIndex};

    Map<String, dynamic> jsonResponse = await repositoryExecutor
        .getAsJsonObject(Url.moviePopular, queryParams: queryParams);

    final movieResponseListModel = parseListFromJsonResponse(jsonResponse,
        'results', (jsonItem) => MovieResponseModel.fromJson(jsonItem));

    return parseToMovieListModel(movieResponseListModel);
  }

  Future<List<MovieModel>> parseToMovieListModel(
      List<MovieResponseModel> movieListResponseModel) async {
    final favoriteWatchedMovieList =
        await dbRepository.getWatchedFavoriteMovieList();

    final genreList = GetIt.I.get<List<GenreResponseModel>>();

    return movieListResponseModel
        .map((e) => MovieModel(
            movieResponseModel: e,
            isWatched: favoriteWatchedMovieList.containsKey(e.id) &&
                favoriteWatchedMovieList[e.id].isWatched,
            isFavorite: favoriteWatchedMovieList.containsKey(e.id) &&
                favoriteWatchedMovieList[e.id].isFavorite))
        .toList();
  }
}
