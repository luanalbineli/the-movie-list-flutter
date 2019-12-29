import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:the_movie_list_flutter/util/index.dart';

class RepositoryExecutor {
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const apiToken = '';

  final BuildContext context;

  RepositoryExecutor({this.context}) : assert(context != null);

  Future<http.StreamedResponse> get(String path, {bool authenticated: true}) =>
      _executeRequest('get', path);

  Future<Map<String, dynamic>> getJsonObject(String path,
      {bool authenticated: true}) async {
    var result = await _executeRequest('get', path);
    String stringBody = await result.stream.bytesToString();

    var jsonResult = jsonDecode(stringBody);
    Logging.printWrapped('getJsonObject - JSON result: $stringBody');
    return jsonResult;
  }

  post(String path,
          {bool authenticated: true, Map<String, String> bodyFields}) =>
      _executeRequest('get', path, bodyFields: bodyFields);

  Future<http.StreamedResponse> _executeRequest(String method, String path,
      {Map<String, String> bodyFields}) async {
    Uri uri = getFinalUri(path);
    var request = http.Request(method, uri);

    if (bodyFields != null) {
      request.body = jsonEncode(bodyFields);
    }

    http.StreamedResponse response = await request.send();
    if (response.statusCode < 200 || response.statusCode > 299) {
      throw HttpException(
          'An error occurred while tried to fetch the data. Status: ${response.statusCode}');
    }

    return response;
  }

  Uri getFinalUri(String path) {
    Uri uri = Uri.parse(baseUrl + path);

    Locale locale = Localizations.localeOf(context);

    uri.queryParameters.addEntries(
      [MapEntry('api_key', 'Bearer $apiToken'),
      MapEntry('region', 'Bearer ${locale.countryCode}')]
    );
    return uri;
  }
}
