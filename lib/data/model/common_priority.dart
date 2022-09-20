class CommonPriority{
  final String number;
  final String country;
  final String filing_date;

  CommonPriority({
    required this.number,
    required this.country,
    required this.filing_date,
  });

  factory CommonPriority.fromJSON(Map<String, dynamic> json){
    return CommonPriority(
        number: json['number'] ?? '',
        country: json['country'] ?? '',
        filing_date: json['filing_date'] ?? '',
    );
  }
}