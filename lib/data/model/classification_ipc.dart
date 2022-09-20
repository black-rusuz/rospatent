class ClassificationIpc{
  final int main_group;
  final String classification_value;
  final int subgroup;
  final String subclass;
  final String section;
  final String fullname;
  final int class_num;

  ClassificationIpc({
    required this.main_group,
    required this.classification_value,
    required this.subgroup,
    required this.subclass,
    required this.section,
    required this.fullname,
    required this.class_num,
  });

  factory ClassificationIpc.fromJSON(Map<String, dynamic> json){
    json = json['ipc'];
    return ClassificationIpc(
        main_group: json['main_group'] ?? '',
        classification_value: json['classification_value'] ?? '',
        subgroup: json['subgroup'] ?? '',
        subclass: json['subclass'] ?? '',
        section: json['section'] ?? '',
        fullname: json['fullname'] ?? '',
        class_num: json['class_num'] ?? '',
    );
  }
}