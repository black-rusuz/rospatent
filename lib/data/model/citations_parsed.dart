import 'citations_parsed_doc.dart';

class CitationsParsed{
  final String text;
  final CitationsParsedDoc doc;

  CitationsParsed({
    required this.text,
    required this.doc,
  });

  factory CitationsParsed.fromJSON(Map<String, dynamic> json){
    return CitationsParsed(
        text: json['text'] ?? '',
        doc: CitationsParsedDoc.fromJSON(json['doc']),
    );
  }
}