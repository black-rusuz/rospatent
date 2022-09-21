import 'citations_parsed.dart';

abstract class Biblio {
  final List<String> applicants;
  final String citations;
  final List<String> inventors;
  final String title;
  final List<String> patentees;
  final List<CitationsParsed> citationsParsed;

  Biblio({
    required this.applicants,
    required this.citations,
    required this.inventors,
    required this.title,
    required this.patentees,
    required this.citationsParsed,
  });
}

class BiblioRu extends Biblio {
  BiblioRu({
    required super.applicants,
    required super.citations,
    required super.inventors,
    required super.title,
    required super.patentees,
    required super.citationsParsed,
  });

  // TODO: locale?
  factory BiblioRu.fromJson(Map<String, dynamic> json) {
    json = json['ru'];
    return BiblioRu(
      applicants: json['applicant_name'] ?? [],
      citations: json['citations'] ?? '',
      inventors:
          json['inventor'].map((e) => e['name']).whereType<String>().toList(),
      title: json['title'] ?? '',
      patentees:
          json['patentee'].map((e) => e['name']).whereType<String>().toList(),
      citationsParsed: (json['citations_parsed'] ?? [])
          .map((e) => CitationsParsed.fromJson(e))
          .whereType<CitationsParsed>()
          .toList(),
    );
  }
}
