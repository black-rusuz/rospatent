class CommonCitated {
  final String identity;
  final int publicationDate;
  final String id;

  CommonCitated({
    required this.identity,
    required this.publicationDate,
    required this.id,
  });

  factory CommonCitated.fromJson(Map<String, dynamic> json) {
    return CommonCitated(
      identity: json['identity'] ?? '',
      publicationDate: json['publication_date'] ?? '',
      id: json['id'] ?? '',
    );
  }
}
