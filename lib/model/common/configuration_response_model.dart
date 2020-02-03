import 'package:flutter/material.dart';

class ConfigurationResponseModel {
  static final String originalImageSizeName = 'original';

  final String secureBaseUrl;

  ConfigurationResponseModel({
    @required this.secureBaseUrl,

  });

  factory ConfigurationResponseModel.fromJson(Map<String, dynamic> jsonResponse) {
    return ConfigurationResponseModel(secureBaseUrl: jsonResponse['secure_base_url']);
  }
}