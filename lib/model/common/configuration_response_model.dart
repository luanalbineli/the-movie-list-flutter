import 'package:flutter/material.dart';

class ConfigurationResponseModel {
  static final String originalImageSizeName = 'original';

  final String secureBaseUrl;

  ConfigurationResponseModel({
    @required this.secureBaseUrl,

  });

  factory ConfigurationResponseModel.fromJson(Map<String, dynamic> jsonResponse) {
    return ConfigurationResponseModel(secureBaseUrl: jsonResponse['images']['secure_base_url']);
  }

  String getImagePath(String imageKey) => secureBaseUrl + 'w185' + imageKey;
}