class CitationsParsedDoc {
  final int docNumber;
  final String publishingOffice;
  final String kind;
  final String publicationDate;
  final String identity;

  CitationsParsedDoc(
      {required this.docNumber,
      required this.publishingOffice,
      required this.kind,
      required this.publicationDate,
      required this.identity});

  factory CitationsParsedDoc.fromJson(Map<String, dynamic> json) {
    return CitationsParsedDoc(
      docNumber: int.tryParse(json['doc_number'] ?? '') ?? 0,
      publishingOffice: json['publishing_office'] ?? '',
      kind: json['kind'] ?? '',
      publicationDate: json['publication_date'] ?? '',
      identity: json['identity'] ?? '',
    );
  }
}
