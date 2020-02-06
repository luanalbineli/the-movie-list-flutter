import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/enum/index.dart';

abstract class MainState extends Equatable {
  final MenuType menuType;

  MainState(this.menuType);

  @override
  List<Object> get props => [menuType];
}

class MainStateInitial extends MainState {
  MainStateInitial(): super(MenuType.home);
}

class MainStateTabChanged extends MainState {
  MainStateTabChanged({ @required MenuType menuType }): super(menuType);
}