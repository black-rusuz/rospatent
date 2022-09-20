class CommonPriority {
  final String number;
  final String country;
  final String filingDate;

  CommonPriority({
    required this.number,
    required this.country,
    required this.filingDate,
  });

  factory CommonPriority.fromJson(Map<String, dynamic> json) {
    return CommonPriority(
      number: json['number'] ?? '',
      country: json['country'] ?? '',
      filingDate: json['filing_date'] ?? '',
    );
  }
}
