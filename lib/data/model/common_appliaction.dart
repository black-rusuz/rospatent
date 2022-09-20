class CommonApplication {
  final String number;
  final String filingDate;

  CommonApplication({
    required this.number,
    required this.filingDate,
  });

  factory CommonApplication.fromJson(Map<String, dynamic> json) {
    return CommonApplication(
      number: json['number'] ?? '',
      filingDate: json['filing_date'] ?? '',
    );
  }
}
