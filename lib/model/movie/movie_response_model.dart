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

  MovieResponseModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        posterPath = json['poster_path'],
        overview = json['overview'],
        title = json['title'],
        voteAverage = json['vote_average'].toDouble(),
        releaseDate = json['release_date'] == null
            ? null
            : DateTime.parse(json['release_date']),
        backdropPath = json['backdrop_path'],
        genreIdList = json['genre_ids'].cast<int>();
}
