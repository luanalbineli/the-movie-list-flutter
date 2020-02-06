import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/lang/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

class CinemaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context);

    return Column(
      children: <Widget>[
        AppBar(
          centerTitle: true,
          backgroundColor: ColorSets.martinique,
          title: Text(appLocalizations.textCinema,
              style: TextStyle(color: Colors.white)),
        ),
        Expanded(
          child: Container(color: ColorSets.blackPearl),
        )
      ],
    );
  }
}
