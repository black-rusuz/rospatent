import 'hit.dart';

class Response {
  final int total;
  final int available;
  final List hits;

  Response({required this.total, required this.available, required this.hits});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      total: json['total'],
      available: json['available'],
      hits: (json['hits'] as List).map((e) => Hit.fromJson(e)).toList(),
    );
  }
}
