class MetaSource {
  final String path;
  final String file;
  final String index;
  final String from;

  MetaSource({
    required this.path,
    required this.file,
    required this.index,
    required this.from,
  });

  factory MetaSource.fromJson(Map<String, dynamic> json) {
    json = json['source'];
    return MetaSource(
      path: json['json'] ?? '',
      file: json['file'] ?? '',
      index: json['index'] ?? '',
      from: json['from'] ?? '',
    );
  }
}
