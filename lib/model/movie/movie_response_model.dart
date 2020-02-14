import 'package:the_movie_list_flutter/extensions/index.dart';

class MovieResponseModel {
  final int id;
  final String posterPath;
  final String overview;
  final String title;
  final double voteAverage;
  final DateTime releaseDate;
  final String backdropPath;
  final List<int> genreIdList;

  MovieResponseModel(this.id, this.posterPath, this.overview, this.title,
      this.voteAverage, this.releaseDate, this.backdropPath, this.genreIdList);


  MovieResponseModel.fromJson(Map<String, dynamic> json): 
    id = json['id'],
    posterPath = json['poster_path'],
    overview = json['overview'],
    title = json['title'],
    voteAverage = json['vote_average'],
    releaseDate = json['release_date'] == null ? null : json['release_date'].parseDateTime(),
    backdropPath = json['backdrop_path'],
    genreIdList = json['genre_ids']
    ;
}
