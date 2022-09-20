class Drawings{
  final String url;
  final int width;
  final int height;
  final String format;
  final String content;

  Drawings({
    required this.url,
    required this.width,
    required this.height,
    required this.format,
    required this.content,
  });

  factory Drawings.fromJSON(Map<String, dynamic> json){
    return Drawings(
      url: json['url'] ?? '',
      width: json['width'] ?? '',
      height: json['height'] ?? '',
      format: json['format'] ?? '',
      content: json['content'] ?? '',
    );
  }
}