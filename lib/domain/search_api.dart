import '../data/model/search_response.dart';

abstract class SearchApi {
  abstract final String url;

  Future<SearchResponse> search(String pattern);
}
