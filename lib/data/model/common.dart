import 'common_appliaction.dart';
import 'common_priority.dart';
import 'classification_ipc.dart';
import 'common_citated.dart';

class Common{
  final String publishing_office;
  final int doc_number;
  final String kind;
  final String publication_date;
  final CommonPriority priority;
  final CommonApplication application;
  final ClassificationIpc classification;
  final String family_id;
  final List<CommonCitated> citated_docs;

  Common({
    required this.publishing_office,
    required this.doc_number,
    required this.kind,
    required this.publication_date,
    required this.priority,
    required this.application,
    required this.classification,
    required this.family_id,
    required this.citated_docs,
  });

  factory Common.fromJSON(Map<String, dynamic> json){
    json = json['common'];
    return Common(
      publishing_office: json['publishing_office'] ?? '',
      doc_number: json['doc_number'] ?? '',
      kind: json['kind'] ?? '',
      publication_date: json['publication_date'] ?? '',
      priority: CommonPriority.fromJSON(json['priority']),
      application: CommonApplication.fromJSON(json['application']),
      classification: ClassificationIpc.fromJSON(json['classification']),
      family_id: json['family']['docdb_family_id'] ?? '',
      citated_docs: (json['citated_docs'] as List).map((e) => CommonCitated.fromJSON(e)).toList(),
    );
  }
}