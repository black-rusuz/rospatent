class CitationsParsedDoc{
  final int doc_number;
  final String publishing_office;
  final String kind;
  final String publication_date;
  final String identity;

  CitationsParsedDoc({
    required this.doc_number,
    required this.publishing_office,
    required this.kind,
    required this.publication_date,
    required this.identity
  });

  factory CitationsParsedDoc.fromJSON(Map<String, dynamic> json){
    return CitationsParsedDoc(
        doc_number: json['doc_number'] ?? '',
        publishing_office: json['publishing_office'] ?? '',
        kind: json['kind'] ?? '',
        publication_date: json['publication_date'] ?? '',
        identity: json['identity'] ?? '',
    );
  }
}