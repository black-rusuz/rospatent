import '../data/model/search_response.dart';

abstract class SearchApi {
  abstract final String url;

  Future<SearchResponse> search(String pattern, {int page = 1});

  Future<SearchResponse> searchSimilar(String id, {int page = 1});

  Future<SearchResponse> searchExtended(
    String pattern, {
    Map<String, dynamic>? arguments,
    int page = 1,
  });
}
