import 'package:flutter/cupertino.dart';

import '../providers/style.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({super.key});

  static const TextStyle text = TextStyle(
    color: Styles.primary,
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle number = TextStyle(
    color: Styles.blue,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );

  static const String firstPart =
      'Предоставляется возможность проведения поиска по мировому патентному фонду включающему';

  static const secondPart =
      'стран и организаций, в том числе все доступные русскоязычные массивы';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(firstPart, style: text),
          Text('26', style: number),
          Text(secondPart, style: text),
        ],
      ),
    );
  }
}
