import 'citations_parsed.dart';

class Biblio {
  final List<String> inventor;
  final String title;
  final List<String> patentee;
  final List<String> applicant;
  final String citations;
  final List<CitationsParsed> citations_parsed;

  Biblio({
    required this.inventor,
    required this.title,
    required this.patentee,
    required this.applicant,
    required this.citations,
    required this.citations_parsed,
  });

  // TODO
  factory Biblio.fromJson(Map<String, dynamic> json) {
    return Biblio(
      inventor: (json['inventor'] as List).map((e) => json['name'].toString() ?? '').toList(),
      title: json['title'],
      patentee: (json['patentee'] as List).map((e) => json['name'].toString() ?? '').toList(),
      applicant: (json['applicant'] as List).map((e) => json['name'].toString() ?? '').toList(),
      citations: json['citations'],
      citations_parsed: (json['citations_parsed'] as List).map((e) => CitationsParsed.fromJSON(e)).toList()
    );
  }
}
