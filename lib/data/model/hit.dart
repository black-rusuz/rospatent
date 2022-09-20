import 'meta_source.dart';
import 'snippet.dart';
import 'common.dart';
import 'drawings.dart';

class Hit {
  final Common common;
  final MetaSource meta;
  final biblio;
  final Drawings drawings;
  final String id;
  final String index;
  final String dataset;
  final double similarity;
  final double similarityNorm;
  final Snippet snippet;

  Hit({
    required this.common,
    required this.meta,
    required this.biblio,
    required this.drawings,
    required this.id,
    required this.index,
    required this.dataset,
    required this.similarity,
    required this.similarityNorm,
    required this.snippet,
  });

  factory Hit.fromJson(Map<String, dynamic> json) {
    return Hit(
      common: Common.fromJSON(json['common']),
      meta: MetaSource.fromJson(json['meta']),
      biblio: json['biblio'],
      drawings: Drawings.fromJSON(json['drawings']),
      id: json['id'],
      index: json['index'],
      dataset: json['dataset'],
      similarity: json['similarity'],
      similarityNorm: json['similarity_norm'],
      snippet: Snippet.fromJson(json['snippet']),
    );
  }
}
