import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../domain/search_api.dart';
import '../utils/json_print.dart';
import 'model/hit.dart';
import 'model/search_response.dart';

// TODO: это тоже нахуй, но можно ебануть ещё один env
const bool debugMode = !true;

@Singleton(as: SearchApi)
class SearchApiImpl implements SearchApi {
  final Dio client;

  SearchApiImpl({required this.client}) {
    client.options.headers = headers;
  }

  @override
  final String url = 'https://searchplatform.rospatent.gov.ru';

  final String apiKey = '7ec9e488107e4c79b140b1a9468781a7';

  Map<String, String> get headers => {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      };

  Map<String, dynamic> getSearchBody(
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
        '$url/patsearch/v0.2/search',
        data: getSearchBody(pattern, page: page),
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

  Map<String, dynamic> getSimilarBody(
    String id, {
    required int page,
    Map<String, dynamic>? arguments,
  }) {
    arguments ??= {};
    arguments.addAll({
      'pat_id': id,
      'offset': page * 10,
      'pre_tag': '<span>',
      'post_tag': '</span>',
      'type_search': 'id_search',
    });
    return arguments;
  }

  @override
  Future<SearchResponse> searchSimilar(String id, {int page = 1}) async {
    final timer = Stopwatch()..start();

    final response = await client.post(
      '$url/patsearch/v0.2/similar_search',
      data: getSimilarBody(id, page: page),
    );
    final Map<String, dynamic> data = response.data;

    final model = SearchResponse.fromJson(data);
    debugPrint('LOAD TIME: ${timer.elapsed}');
    return model;
  }

  @override
  Future<SearchResponse> searchExtended(
    String pattern, {
    Map<String, dynamic>? arguments,
    int page = 1,
  }) async {
    final timer = Stopwatch()..start();

    final response = await client.post(
      '$url/patsearch/v0.2/search',
      data: getSearchBody(pattern, arguments: arguments, page: page),
    );
    final Map<String, dynamic> data = response.data;

    final model = SearchResponse.fromJson(data);
    debugPrint('LOAD TIME: ${timer.elapsed}');
    return model;
  }

  @override
  Future<Hit> getDocument(String id) async {
    final timer = Stopwatch()..start();

    final response = await client.post('$url/docs/$id');
    final Map<String, dynamic> data = response.data;
    JsonPrint(response.data);

    final model = Hit.fromJson(data);
    debugPrint('LOAD TIME: ${timer.elapsed}');
    return model;
  }
}
