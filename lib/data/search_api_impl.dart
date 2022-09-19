import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

import '../domain/search_api.dart';
import 'model/search_response.dart';

// TODO: это тоже нахуй, но можно ебануть ещё один env
const bool debugMode = true;

// TODO: нахуй оно тут?
class Print {
  static void json(Object? json) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    final String output = encoder.convert(json);
    debugPrint(output);
  }
}

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
  Future<void> search(String pattern) async {
    final timer = Stopwatch()..start();
    late final data;
    if (!debugMode) {
      final response = await client.post('$url/search', data: {'q': pattern});
      data = response.data;
      print(response.statusCode);
    } else {
      final json = await rootBundle.loadString('assets/json/response.json');
      data = jsonDecode(json);
    }
    //Print.json(data);
    final model = SearchResponse.fromJson(data);
    debugPrint('LOAD TIME: ${timer.elapsed}');
  }
}
