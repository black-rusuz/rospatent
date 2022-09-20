import 'classification_ipc.dart';
import 'common_appliaction.dart';
import 'common_citated.dart';
import 'common_priority.dart';

class Common {
  final String publishingOffice;
  final String documentNumber;
  final String kind;
  final String publicationDate;
  final List<CommonPriority> priority;
  final CommonApplication application;
  final List<Classification> classification;
  final String familyId;
  final List<CommonCitated> citatedDocs;

  Common({
    required this.publishingOffice,
    required this.documentNumber,
    required this.kind,
    required this.publicationDate,
    required this.priority,
    required this.application,
    required this.classification,
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
          .map((e) => CommonPriority.fromJson(e))
          .whereType<CommonPriority>()
          .toList(),
      application: CommonApplication.fromJson(json['application']),
      classification: classifications.values
          .map((e) => Classification.fromJson(e))
          .whereType<Classification>()
          .toList(),
      familyId: json['family']?['docdb_family_id'] ?? '',
      citatedDocs: (json['citated_docs'] ?? [])
          .map((e) => CommonCitated.fromJson(e))
          .whereType<CommonCitated>()
          .toList(),
    );
  }
}
