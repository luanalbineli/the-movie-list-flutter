import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_list_flutter/enum/index.dart';
import 'package:the_movie_list_flutter/lang/app_localizations.dart';
import 'package:the_movie_list_flutter/screens/index.dart';
import 'package:the_movie_list_flutter/theme/index.dart';

class MainContent extends StatelessWidget {
  void _onItemTapped(MainBloc mainBloc, int index) =>
      mainBloc.add(MainEventTabChanged(menuType: MenuType.values[index]));

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context);
    final MainBloc mainBloc = BlocProvider.of<MainBloc>(context);
    final bottomNavigationBarItems =
        _getBottomNavigationBarItems(appLocalizations);
    final contentList = _getContentList();

    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorSets.blackPearl,
          body: Center(
            child: contentList.elementAt(state.menuType.index),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomNavigationBarItems,
            currentIndex: state.menuType.index,
            backgroundColor: ColorSets.blackPearl,
            unselectedItemColor: ColorSets.waterloo,
            selectedItemColor: ColorSets.cerulean,
            onTap: (index) => _onItemTapped(mainBloc, index),
          ),
        );
      },
    );
  }

  List<BottomNavigationBarItem> _getBottomNavigationBarItems(
      AppLocalizations appLocalizations) {
    final bottomNavigationBarItemInfos = {
      appLocalizations.textHome: Icons.home,
      appLocalizations.textSearch: Icons.search,
      appLocalizations.textCinema: Icons.play_arrow,
      appLocalizations.textLibrary: Icons.video_library,
    };

    return bottomNavigationBarItemInfos.entries
        .map((menuItem) => BottomNavigationBarItem(
              backgroundColor: ColorSets.martinique,
              icon: Icon(menuItem.value),
              title: Text(menuItem.key),
            ))
        .toList();
  }

  List<Widget> _getContentList() {
    return <Widget>[HomeScreen(), CinemaScreen(), HomeScreen(), HomeScreen()];
  }
}
