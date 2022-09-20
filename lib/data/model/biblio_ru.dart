import 'citations_parsed_doc.dart';

class BiblioRu{
  final List<String> applicant_name;
  final String citations;
  final List<String> inventor_name;
  final String title;
  final List<String> patentee_name;
  final List<CitationsParsedDoc> citations_parsed;

  BiblioRu({
    required this.applicant_name,
    required this.citations,
    required this.inventor_name,
    required this.title,
    required this.patentee_name,
    required this.citations_parsed,
  });

  factory BiblioRu.fromJSON(Map<String, dynamic> json){
    json = json['ru'];
    return BiblioRu(
        applicant_name: json['applicant_name'],
        citations: json['citations'] ?? '',
        inventor_name: (json['inventor'] as List).map((e) => json['name'].toString() ?? '').toList(),
        title: json['title'] ?? '',
        patentee_name: (json['patentee'] as List).map((e) => json['name'].toString() ?? '').toList(),
        citations_parsed: (json['citations_parsed'] as List).map((e) => CitationsParsedDoc.fromJSON(e)).toList(),
    );
  }
}