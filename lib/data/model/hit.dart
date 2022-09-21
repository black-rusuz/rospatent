import 'biblio.dart';
import 'common.dart';
import 'drawings.dart';
import 'meta_source.dart';
import 'snippet.dart';

class Hit {
  final Common common;
  final MetaSource meta;
  final BiblioRu biblio;
  final List<Drawing> drawings;
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
      common: Common.fromJson(json['common']),
      meta: MetaSource.fromJson(json['meta']),
      biblio: BiblioRu.fromJson(json['biblio']),
      drawings: (json['drawings'] ?? [])
          .map((e) => Drawing.fromJson(e))
          .whereType<Drawing>()
          .toList(),
      id: json['id'],
      index: json['index'],
      dataset: json['dataset'],
      similarity: json['similarity'],
      similarityNorm: json['similarity_norm'],
      snippet: Snippet.fromJson(json['snippet']),
    );
  }
}
