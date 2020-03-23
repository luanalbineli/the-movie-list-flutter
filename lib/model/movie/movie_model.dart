import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/model/index.dart';

class MovieModel {
  final MovieResponseModel movieResponseModel;
  final bool isFavorite;
  final bool isWatched;
  final List<GenreResponseModel> genreListModel;

  MovieModel(
      {@required this.movieResponseModel,
      @required this.isFavorite,
      @required this.isWatched,
      @required this.genreListModel});
}
