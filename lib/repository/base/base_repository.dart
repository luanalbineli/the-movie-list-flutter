import 'package:the_movie_list_flutter/repository/base/repository_executor.dart';

abstract class BaseRepository {
  final RepositoryExecutor repositoryExecutor;

  BaseRepository(this.repositoryExecutor) : assert(repositoryExecutor != null);
}
