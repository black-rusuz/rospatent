import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/style.dart';

class HomeInfo extends StatelessWidget {
  const HomeInfo({super.key});

  TextStyle get text => GoogleFonts.ptSans(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Style.primary,
      );

  TextStyle get number => GoogleFonts.ptSans(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Style.accent,
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
        children: [
          Text(firstPart, style: text),
          Text('26', style: number),
          Text(secondPart, style: text),
        ],
      ),
    );
  }
}
