import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_list_flutter/lang/index.dart';
import 'package:the_movie_list_flutter/screens/home/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context);

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        print('HOME_STATE: $state');
        return Column(
          children: <Widget>[
            AppBar(
              centerTitle: true,
              backgroundColor: ColorSets.martinique,
              title: Text(appLocalizations.textHome,
                  style: TextStyle(color: Colors.white)),
            ),
            Expanded(
              child: Container(
                padding: Dimens.defaultScreenPadding,
                color: ColorSets.blackPearl,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _homeTitle(
                          context,
                          appLocalizations,
                          appLocalizations.textMostPopular,
                          () => print('TAP popular')),
                      SizedBox(
                        height: Dimens.defaultVerticalSpacing,
                      ),
                      _homeList(),
                      SizedBox(
                        height: Dimens.defaultVerticalSpacing2x,
                      ),
                      _homeTitle(
                          context,
                          appLocalizations,
                          appLocalizations.textMostRated,
                          () => print('TAP rated')),
                      SizedBox(
                        height: Dimens.defaultVerticalSpacing,
                      ),
                      _homeList(),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _homeTitle(BuildContext context, AppLocalizations appLocalizations,
      String title, GestureTapCallback onTap) {
    final titleStyle =
        Theme.of(context).textTheme.headline5.apply(color: Colors.white);

    final seeAllStyle =
        Theme.of(context).textTheme.bodyText1.apply(color: ColorSets.cardinal);
    return Row(
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(title, style: titleStyle),
        InkWell(
          child: Row(
            children: <Widget>[
              Text(appLocalizations.textSeeAll, style: seeAllStyle),
              Icon(
                Icons.chevron_right,
                color: ColorSets.cardinal,
                size: 24,
              )
            ],
          ),
          onTap: () => print('See alla'),
        )
      ],
    );
  }

  Widget _homeList() {
    return SizedBox(
      height: 150,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 100,
            color: ColorSets.martinique,
          ),
          SizedBox(
            width: Dimens.defaultHorizontalSpacing,
          ),
          Container(
            width: 100,
            color: ColorSets.martinique,
          ),
          SizedBox(
            width: Dimens.defaultHorizontalSpacing,
          ),
          Container(
            width: 100,
            color: ColorSets.martinique,
          ),
          SizedBox(
            width: Dimens.defaultHorizontalSpacing,
          ),
          Container(
            width: 100,
            color: ColorSets.martinique,
          ),
          SizedBox(
            width: Dimens.defaultHorizontalSpacing,
          ),
          Container(
            width: 100,
            color: ColorSets.martinique,
          ),
        ],
      ),
    );
  }
}
