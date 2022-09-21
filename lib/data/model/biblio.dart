abstract class Biblio {
  final List<String> applicants;
  final String citations;
  final List<String> inventors;
  final String title;
  final List<String> patentees;
  final List<CitationsParsed> citationsParsed;

  Biblio({
    required this.applicants,
    required this.citations,
    required this.inventors,
    required this.title,
    required this.patentees,
    required this.citationsParsed,
  });
}

class BiblioRu extends Biblio {
  BiblioRu({
    required super.applicants,
    required super.citations,
    required super.inventors,
    required super.title,
    required super.patentees,
    required super.citationsParsed,
  });

  factory BiblioRu.fromJson(Map<String, dynamic> json) {
    // TODO: locale?
    json = json['ru'] ?? json['en'];
    return BiblioRu(
      applicants: json['applicant_name'] ?? [],
      citations: json['citations'] ?? '',
      inventors:
          json['inventor'].map((e) => e['name']).whereType<String>().toList(),
      title: json['title'] ?? '',
      patentees: (json['patentee'] ?? [])
          .map((e) => e['name'])
          .whereType<String>()
          .toList(),
      citationsParsed: (json['citations_parsed'] ?? [])
          .map((e) => CitationsParsed.fromJson(e))
          .whereType<CitationsParsed>()
          .toList(),
    );
  }
}

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
