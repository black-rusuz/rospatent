class Common {
  final String publishingOffice;
  final String documentNumber;
  final String kind;
  final String publicationDate;
  final List<Priority> priority;
  final Application application;
  final List<Classification> classifications;
  final String familyId;
  final List<Citated> citatedDocs;

  Common({
    required this.publishingOffice,
    required this.documentNumber,
    required this.kind,
    required this.publicationDate,
    required this.priority,
    required this.application,
    required this.classifications,
    required this.familyId,
    required this.citatedDocs,
  });

  factory Common.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> classifications = json['classification'] ?? {};
    return Common(
      publishingOffice: json['publishing_office'] ?? '',
      documentNumber: json['document_number'] ?? '',
      kind: json['kind'] ?? '',
      publicationDate: json['publication_date'] ?? '',
      priority: (json['priority'] ?? [])
          .map((e) => Priority.fromJson(e))
          .whereType<Priority>()
          .toList(),
      application: Application.fromJson(json['application']),
      classifications: classifications.values
          .expand((e) => e)
          .map((e) => Classification.fromJson(e))
          .whereType<Classification>()
          .toList(),
      familyId: json['family']?['docdb_family_id'] ?? '',
      citatedDocs: (json['citated_docs'] ?? [])
          .map((e) => Citated.fromJson(e))
          .whereType<Citated>()
          .toList(),
    );
  }
}

class Priority {
  final String number;
  final String country;
  final String filingDate;

  Priority({
    required this.number,
    required this.country,
    required this.filingDate,
  });

  factory Priority.fromJson(Map<String, dynamic> json) {
    return Priority(
      number: json['number'] ?? '',
      country: json['country'] ?? '',
      filingDate: json['filing_date'] ?? '',
    );
  }
}

class Application {
  final String number;
  final String filingDate;

  Application({
    required this.number,
    required this.filingDate,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      number: json['number'] ?? '',
      filingDate: json['filing_date'] ?? '',
    );
  }
}

class Classification {
  final int mainGroup;
  final String classificationValue;
  final int subgroup;
  final String subclass;
  final String section;
  final String fullName;
  final int classNum;

  Classification({
    required this.mainGroup,
    required this.classificationValue,
    required this.subgroup,
    required this.subclass,
    required this.section,
    required this.fullName,
    required this.classNum,
  });

  factory Classification.fromJson(Map<String, dynamic> json) {
    return Classification(
      mainGroup: int.tryParse(json['main_group'] ?? '') ?? 0,
      classificationValue: json['classification_value'] ?? '',
      subgroup: int.tryParse(json['subgroup'] ?? '') ?? 0,
      subclass: json['subclass'] ?? '',
      section: json['section'] ?? '',
      fullName: json['fullname'] ?? '',
      classNum: int.tryParse(json['class_num'] ?? '') ?? 0,
    );
  }
}

class Citated {
  final String identity;
  final int publicationDate;
  final String id;

  Citated({
    required this.identity,
    required this.publicationDate,
    required this.id,
  });

  factory Citated.fromJson(Map<String, dynamic> json) {
    return Citated(
      identity: json['identity'] ?? '',
      publicationDate: json['publication_date'] ?? '',
      id: json['id'] ?? '',
    );
  }
}
