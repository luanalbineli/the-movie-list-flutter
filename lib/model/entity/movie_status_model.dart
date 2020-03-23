import 'package:flutter/material.dart';

class MovieStatusModel {
  final bool isFavorite;
  final bool isWatched;

  MovieStatusModel({ @required this.isFavorite, @required this.isWatched });
}