import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie_list_flutter/model/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

class HorizontalMovieList extends StatelessWidget {
  final List<MovieModel> movieListModel;

  HorizontalMovieList({@required this.movieListModel});

  @override
  Widget build(BuildContext context) {
    final configurationResponseModel = GetIt.I.get<ConfigurationResponseModel>();
    final movieListItem = movieListModel.map((e) => _movieItem(configurationResponseModel, e)).toList();
    return SizedBox.fromSize(
      size: Size(double.infinity, 300),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: movieListItem,
      ),
    );
  }

  Widget _movieItem(ConfigurationResponseModel configurationResponseModel, MovieModel movieModel) {
    final imageUrl = configurationResponseModel.getImagePath(movieModel.movieResponseModel.posterPath);
    return Column(
      children: <Widget>[
        Image.network(imageUrl, width: Dimens.horizontalMovieListPosterWidth, height: Dimens.horizontalMovieListPosterHeight),
        Text(movieModel.movieResponseModel.title)
      ],
    );
  }
}
