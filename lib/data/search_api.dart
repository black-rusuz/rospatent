import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../domain/i_search_api.dart';

@Singleton(as: ISearchApi)
class SearchApi implements ISearchApi {
  final Client client;

  SearchApi({required this.client});

  final String apiKey = '7ec9e488107e4c79b140b1a9468781a7';

  Map<String, String> get headers => {
        'Authorization': 'Bearer$apiKey',
        'Content-Type': 'application/json',
      };
}
