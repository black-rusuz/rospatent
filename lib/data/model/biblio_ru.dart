import 'citations_parsed_doc.dart';

class BiblioRu {
  final List<String> applicantName;
  final String citations;
  final List<String> inventorName;
  final String title;
  final List<String> patenteeName;
  final List<CitationsParsedDoc> citationsParsed;

  BiblioRu({
    required this.applicantName,
    required this.citations,
    required this.inventorName,
    required this.title,
    required this.patenteeName,
    required this.citationsParsed,
  });

  // TODO: abstract
  factory BiblioRu.fromJson(Map<String, dynamic> json) {
    json = json['ru']; // TODO: locale?
    return BiblioRu(
      applicantName: json['applicant_name'] ?? [],
      citations: json['citations'] ?? '',
      inventorName: json['inventor']
          .map((e) => json['name'])
          .whereType<String>()
          .toList(),
      title: json['title'] ?? '',
      patenteeName: json['patentee']
          .map((e) => json['name'])
          .whereType<String>()
          .toList(),
      citationsParsed: (json['citations_parsed'] ?? [])
          .map((e) => CitationsParsedDoc.fromJson(e))
          .whereType<CitationsParsedDoc>()
          .toList(),
    );
  }
}
