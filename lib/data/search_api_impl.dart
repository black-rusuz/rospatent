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

  @override
  final String url = 'https://searchplatform.rospatent.gov.ru/patsearch/v0.2';

  final String apiKey = '7ec9e488107e4c79b140b1a9468781a7';

  Map<String, String> get headers => {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      };

  SearchApiImpl({required this.client}) {
    client.options.headers = headers;
  }

  @override
  Future<SearchResponse> search(String pattern) async {
    final timer = Stopwatch()..start();
    late final Map<String, dynamic> data;
    if (!debugMode) {
      final body = {
        'q': pattern,
        'pre_tag': '<span>',
        'post_tag': '</span>',
      };
      final response = await client.post('$url/search', data: body);
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
