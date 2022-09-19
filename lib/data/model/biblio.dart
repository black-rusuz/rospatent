class Biblio {
  final String inventor;
  final String title;
  final String patentee;
  final String applicant;

  Biblio({
    required this.inventor,
    required this.title,
    required this.patentee,
    required this.applicant,
  });

  // TODO
  factory Biblio.fromJson(Map<String, dynamic> json) {
    return Biblio(
      inventor: json['inventor'],
      title: json['title'],
      patentee: json['patentee'],
      applicant: json['applicant'],
    );
  }
}
