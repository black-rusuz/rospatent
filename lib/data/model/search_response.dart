import 'hit.dart';

class SearchResponse {
  final int total;
  final int available;
  final List<Hit> hits;

  SearchResponse({
    required this.total,
    required this.available,
    required this.hits,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      total: json['total'],
      available: json['available'],
      hits: json['hits'].map((e) => Hit.fromJson(e)).whereType<Hit>().toList(),
    );
  }
}
