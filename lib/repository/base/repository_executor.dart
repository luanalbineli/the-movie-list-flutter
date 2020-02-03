import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RepositoryExecutor {
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const apiToken = 'a28afa7bae56cdcac60edec189769acd';

  final BuildContext context;

  RepositoryExecutor({@required this.context}) : assert(context != null);

  Future<Map<String, dynamic>> getAsJsonObject(String path,
      {bool authenticated: true}) async {
    Map<String, dynamic> jsonObject =
        await _getAsJson(path, authenticated: authenticated);
    return jsonObject;
  }

  /* Future<List<Map<String, dynamic>>> getAsJsonArray(String path,
      {bool authenticated: true}) async {
    List<Map<String, dynamic>> jsonArrayObject =
        await _getAsJson(path, authenticated: authenticated);
    return jsonArrayObject;
  } */

  Future<dynamic> _getAsJson(String path, {bool authenticated: true}) async {
    var result = await _executeRequest('get', path);
    String stringBody = await result.stream.bytesToString();

    return jsonDecode(stringBody);
  }

  post(String path,
          {bool authenticated: true, Map<String, String> bodyFields}) =>
      _executeRequest('post', path, bodyFields: bodyFields);

  Future<http.StreamedResponse> _executeRequest(String method, String path,
      {Map<String, String> bodyFields}) async {
    Uri uri = getFinalUri(path);
    print('Final uri: $uri');
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
    Map<String, dynamic> queryParameters = {
      'api_key': apiToken,
      'region': locale.countryCode
    };
    return uri.replace(queryParameters: queryParameters);
  }
}
