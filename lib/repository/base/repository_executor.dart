import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RepositoryExecutor {
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const apiToken = 'a28afa7bae56cdcac60edec189769acd';

  RepositoryExecutor();

  Future<Map<String, dynamic>> getAsJsonObject(String path, { Map<String, dynamic> queryParams }) async {
    Map<String, dynamic> jsonObject =
        await _getAsJson(path, queryParams: queryParams);
    return jsonObject;
  }

  Future<dynamic> _getAsJson(String path, { Map<String, dynamic> queryParams }) async {
    var result = await _executeRequest('get', path, queryParams: queryParams);
    String stringBody = await result.stream.bytesToString();

    return jsonDecode(stringBody);
  }

  post(String path,
          {bool authenticated: true, Map<String, String> bodyFields}) =>
      _executeRequest('post', path, bodyFields: bodyFields);

  Future<http.StreamedResponse> _executeRequest(String method, String path,
      {Map<String, String> bodyFields, Map<String, dynamic> queryParams}) async {
    Uri uri = getFinalUri(path, queryParams);
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

  Uri getFinalUri(String path, Map<String, dynamic> queryParams) {
    Uri uri = Uri.parse(baseUrl + path);
    // Locale locale = Localizations.localeOf(context);
    Map<String, dynamic> queryParameters = {
      'api_key': apiToken,
      'language': 'pt-BR',
      'page': '1'
    };
    return uri.replace(queryParameters: queryParameters);
  }
}
