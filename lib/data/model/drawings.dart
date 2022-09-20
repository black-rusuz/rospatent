class Drawing {
  final String url;
  final int width;
  final int height;
  final String format;
  final String content;

  Drawing({
    required this.url,
    required this.width,
    required this.height,
    required this.format,
    required this.content,
  });

  factory Drawing.fromJson(Map<String, dynamic> json) {
    return Drawing(
      url: json['url'] ?? '',
      width: int.tryParse(json['width'] ?? '') ?? 0,
      height: int.tryParse(json['height'] ?? '') ?? 0,
      format: json['format'] ?? '',
      content: json['content'] ?? '',
    );
  }
}
