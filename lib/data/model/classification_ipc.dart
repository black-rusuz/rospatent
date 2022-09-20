class ClassificationIpc {
  final int mainGroup;
  final String classificationValue;
  final int subgroup;
  final String subclass;
  final String section;
  final String fullName;
  final int classNum;

  ClassificationIpc({
    required this.mainGroup,
    required this.classificationValue,
    required this.subgroup,
    required this.subclass,
    required this.section,
    required this.fullName,
    required this.classNum,
  });

  factory ClassificationIpc.fromJson(Map<String, dynamic> json) {
    if (json.runtimeType is Map) {
      json = json['ipc'];
    }
    return ClassificationIpc(
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
