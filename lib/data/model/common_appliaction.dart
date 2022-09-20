class CommonApplication{
  final String number;
  final String filing_date;

  CommonApplication({
    required this.number,
    required this.filing_date,
  });

  factory CommonApplication.fromJSON(Map<String, dynamic> json){
    return CommonApplication(
        number: json['number'] ?? '',
        filing_date: json['filing_date'] ?? '',
    );
  }
}