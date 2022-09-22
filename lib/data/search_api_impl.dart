import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../domain/search_api.dart';
import '../utils/json_print.dart';
import 'model/search_response.dart';

// TODO: это тоже нахуй, но можно ебануть ещё один env
const bool debugMode = true;

@Singleton(as: SearchApi)
class SearchApiImpl implements SearchApi {
  final Dio client;

  SearchApiImpl({required this.client}) {
    client.options.headers = headers;
  }

  @override
  final String url = 'https://searchplatform.rospatent.gov.ru/patsearch/v0.2';

  final String apiKey = '7ec9e488107e4c79b140b1a9468781a7';

  Map<String, String> get headers => {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      };

  Map<String, dynamic> getBody(
    String pattern, {
    required int page,
    Map<String, dynamic>? arguments,
  }) {
    arguments ??= {};
    arguments.addAll({
      'q': pattern,
      'offset': page * 10,
      'pre_tag': '<span>',
      'post_tag': '</span>',
    });
    return arguments;
  }

  @override
  Future<SearchResponse> search(String pattern, {int page = 1}) async {
    final timer = Stopwatch()..start();
    late final Map<String, dynamic> data;
    if (!debugMode) {
      final response = await client.post(
        '$url/search',
        data: getBody(pattern, page: page),
      );
      data = response.data;
      debugPrint('HTTP: ${response.statusCode}');
    } else {
      final json = await rootBundle.loadString('assets/json/response.json');
      data = jsonDecode(json);
    }
    //JsonPrint(data);
    final model = SearchResponse.fromJson(data);
    debugPrint('LOAD TIME: ${timer.elapsed}');
    return model;
  }
}
