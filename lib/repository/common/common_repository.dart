import 'package:the_movie_list_flutter/repository/base/base_repository.dart';
import 'package:the_movie_list_flutter/repository/base/repository_executor.dart';
import 'package:the_movie_list_flutter/util/index.dart';
import 'package:the_movie_list_flutter/model/index.dart';

class CommonRepository extends BaseRepository {
  CommonRepository(RepositoryExecutor repositoryExecutor)
      : super(repositoryExecutor);

  Future<ConfigurationResponseModel> getConfiguration() async {
    Map<String, dynamic> jsonResponse = await repositoryExecutor.getAsJsonObject(Url.configuration);
    return ConfigurationResponseModel.fromJson(jsonResponse);
  }

  Future<List<GenreResponseModel>> getGenreList() async {
    Map<String, dynamic> jsonResponse = await repositoryExecutor.getAsJsonObject(Url.genreList);
    List<dynamic> jsonGenreList = jsonResponse['genres'];
    return jsonGenreList.map((genreJsonResponse) => GenreResponseModel.fromJson(genreJsonResponse)).toList();
  }
}
