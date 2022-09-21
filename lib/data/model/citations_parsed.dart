class CitationsParsed {
  final String text;
  final int? docNumber;
  final String? publishingOffice;
  final String? kind;
  final String? publicationDate;
  final String? identity;

  CitationsParsed({
    required this.text,
    required this.docNumber,
    required this.publishingOffice,
    required this.kind,
    required this.publicationDate,
    required this.identity,
  });

  factory CitationsParsed.fromJson(Map<String, dynamic> json) {
    final doc = json['doc'];
    return CitationsParsed(
      text: json['text'] ?? '',
      docNumber: int.tryParse(doc?['doc_number'] ?? ''),
      publishingOffice: doc?['publishing_office'],
      kind: doc?['kind'],
      publicationDate: doc?['publication_date'],
      identity: doc?['identity'],
    );
  }
}
