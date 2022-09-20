import 'citations_parsed_doc.dart';

class BiblioRu {
  final List<String> applicants;
  final String citations;
  final List<String> inventors;
  final String title;
  final List<String> patentees;
  final List<CitationsParsedDoc> citationsParsed;

  BiblioRu({
    required this.applicants,
    required this.citations,
    required this.inventors,
    required this.title,
    required this.patentees,
    required this.citationsParsed,
  });

  // TODO: abstract
  factory BiblioRu.fromJson(Map<String, dynamic> json) {
    json = json['ru']; // TODO: locale?
    return BiblioRu(
      applicants: json['applicant_name'] ?? [],
      citations: json['citations'] ?? '',
      inventors: json['inventor']
          .map((e) => e['name'])
          .whereType<String>()
          .toList(),
      title: json['title'] ?? '',
      patentees: json['patentee']
          .map((e) => e['name'])
          .whereType<String>()
          .toList(),
      citationsParsed: (json['citations_parsed'] ?? [])
          .map((e) => CitationsParsedDoc.fromJson(e))
          .whereType<CitationsParsedDoc>()
          .toList(),
    );
  }
}
