import 'package:flutter/material.dart';

class GenreResponseModel {
  static final String originalImageSizeName = 'original';

  final int id;
  final String name;

  GenreResponseModel({
    @required this.id,
    @required this.name,
  });

  factory GenreResponseModel.fromJson(Map<String, dynamic> jsonResponse) {
    return GenreResponseModel(
        id: jsonResponse['id'], name: jsonResponse['name']);
  }
}
