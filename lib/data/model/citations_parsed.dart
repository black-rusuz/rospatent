import 'citations_parsed_doc.dart';

class CitationsParsed {
  final String text;
  final CitationsParsedDoc doc;

  CitationsParsed({
    required this.text,
    required this.doc,
  });

  factory CitationsParsed.fromJson(Map<String, dynamic> json) {
    return CitationsParsed(
      text: json['text'] ?? '',
      doc: CitationsParsedDoc.fromJson(json['doc']),
    );
  }
}
