import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../domain/i_search_api.dart';

@Singleton(as: ISearchApi)
class SearchApi implements ISearchApi {
  final Dio client;

  @override
  final String url = 'https://searchplatform.rospatent.gov.ru/patsearch/v0.2';

  final String apiKey = '7ec9e488107e4c79b140b1a9468781a7';

  Map<String, String> get headers => {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      };

  SearchApi({required this.client}) {
    client.options.headers = headers;
  }

  @override
  Future<void> search(String data) async {
    final response = await client.post('$url/search', data: {'q': data});
  }
}
