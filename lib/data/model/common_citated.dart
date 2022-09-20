class CommonCitated{
  final String identity;
  final int publication_date;
  final String id;

  CommonCitated({
    required this.identity,
    required this.publication_date,
    required this.id,
  });

  factory CommonCitated.fromJSON(Map<String, dynamic> json){
    return CommonCitated(
        identity: json['identity'] ?? '',
        publication_date: json['publication_date'] ?? '',
        id: json['id'] ?? '',
    );
  }
}