class Snippet {
  final String title;
  final String description;
  final String lang;
  final String applicant;
  final String inventor;
  final classification;

  Snippet({
    required this.title,
    required this.description,
    required this.lang,
    required this.applicant,
    required this.inventor,
    required this.classification,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) {
    return Snippet(
      title: json['title'],
      description: json['description'],
      lang: json['lang'],
      applicant: json['applicant'] ?? '',
      inventor: json['inventor'],
      classification: json['classification'],
    );
  }
}
