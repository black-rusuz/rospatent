import 'classification_ipc.dart';
import 'common_appliaction.dart';
import 'common_citated.dart';
import 'common_priority.dart';

class Common {
  final String publishingOffice;
  final int docNumber;
  final String kind;
  final String publicationDate;
  final CommonPriority priority;
  final CommonApplication application;
  final ClassificationIpc classification;
  final String familyId;
  final List<CommonCitated> citatedDocs;

  Common({
    required this.publishingOffice,
    required this.docNumber,
    required this.kind,
    required this.publicationDate,
    required this.priority,
    required this.application,
    required this.classification,
    required this.familyId,
    required this.citatedDocs,
  });

  factory Common.fromJson(Map<String, dynamic> json) {
    return Common(
      publishingOffice: json['publishing_office'] ?? '',
      docNumber: int.tryParse(json['doc_number'] ?? '') ?? 0,
      kind: json['kind'] ?? '',
      publicationDate: json['publication_date'] ?? '',
      priority: CommonPriority.fromJson(json['priority'] ?? {}),
      application: CommonApplication.fromJson(json['application']),
      classification: ClassificationIpc.fromJson(json['classification']),
      familyId: json['family']?['docdb_family_id'] ?? '',
      citatedDocs: (json['citated_docs'] ?? [])
          .map((e) => CommonCitated.fromJson(e))
          .whereType<CommonCitated>()
          .toList(),
    );
  }
}
