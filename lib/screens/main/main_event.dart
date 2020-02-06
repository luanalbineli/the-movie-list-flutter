import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_list_flutter/enum/index.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainEventTabChanged extends MainEvent {
  final MenuType menuType;

  MainEventTabChanged({ @required this.menuType });

  @override
  List<Object> get props => [menuType];
}