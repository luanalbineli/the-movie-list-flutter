import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:the_movie_list_flutter/model/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

class HorizontalMovieList extends StatelessWidget {
  final List<MovieModel> movieListModel;

  HorizontalMovieList({@required this.movieListModel});

  @override
  Widget build(BuildContext context) {
    final configurationResponseModel =
        GetIt.I.get<ConfigurationResponseModel>();
    final widgetList = List<Widget>();
    movieListModel.asMap().forEach((index, value) {
      widgetList.add(_movieItem(context, configurationResponseModel, value));
      if (index + 1 < movieListModel.length) {
        widgetList.add(SizedBox(
          width: Dimens.defaultSpacing,
        ));
      }
    });

    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: widgetList,
      ),
    );
  }

  Widget _movieItem(
      BuildContext context,
      ConfigurationResponseModel configurationResponseModel,
      MovieModel movieModel) {
    final imageUrl = configurationResponseModel
        .getImagePath(movieModel.movieResponseModel.posterPath);

    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.network(imageUrl,
                width: Dimens.horizontalMovieListPosterWidth,
                height: Dimens.horizontalMovieListPosterHeight),
            SizedBox(
              height: Dimens.defaultSpacing0_5x,
            ),
            SizedBox(
              width: Dimens.horizontalMovieListPosterWidth,
              child: Text(
                movieModel.movieResponseModel.title,
                style: Theme.of(context).textTheme.caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.all(4),
          width: Dimens.horizontalMovieListPosterWidth,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
            colors: [Colors.black87, Colors.transparent],
          )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                child: SvgPicture.asset(
                  'assets/images/watched_black.svg',
                  width: 24,
                  color: ColorSets.waterloo,
                ),
                onTap: () => print('TAP'),
              ),
              InkWell(
                child: SvgPicture.asset(
                  'assets/images/favorite_black.svg',
                  width: 24,
                  color: ColorSets.waterloo,
                ),
                onTap: () => print('TAP'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
