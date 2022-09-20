import 'citations_parsed.dart';

class Biblio {
  final List<String> inventor;
  final String title;
  final List<String> patentee;
  final List<String> applicant;
  final String citations;
  final List<CitationsParsed> citationsParsed;

  Biblio({
    required this.inventor,
    required this.title,
    required this.patentee,
    required this.applicant,
    required this.citations,
    required this.citationsParsed,
  });

  factory Biblio.fromJson(Map<String, dynamic> json) {
    return Biblio(
        inventor: json['inventor']
            .map((e) => e['name'])
            .whereType<String>()
            .toList(),
        title: json['title'],
        patentee: json['patentee']
            .map((e) => e['name'])
            .whereType<String>()
            .toList(),
        applicant: json['applicant']
            .map((e) => e['name'])
            .whereType<String>()
            .toList(),
        citations: json['citations'],
        citationsParsed: json['citations_parsed']
            .map((e) => CitationsParsed.fromJson(e))
            .toList());
  }
}
