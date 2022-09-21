import 'package:flutter/material.dart';

import '../../../../data/model/hit.dart';
import '../../../providers/style.dart';

class HeaderRow extends StatelessWidget {
  final Hit item;

  const HeaderRow({super.key, required this.item});

  static TextStyle get boldAccent => Styles.bold.copyWith(color: Styles.accent);

  String get docNum => item.common.documentNumber.replaceAll('00000', '');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            text: item.common.publishingOffice,
            style: Styles.bold,
            children: [
              const TextSpan(text: ' '),
              TextSpan(text: docNum, style: boldAccent),
              const TextSpan(text: ' '),
              TextSpan(text: item.common.kind),
            ],
          ),
        ),
        RichText(
          text: TextSpan(
            text: 'МПК',
            style: Styles.bold,
            children: [
              const TextSpan(text: ' '),
              TextSpan(text: item.snippet.classification, style: boldAccent),
            ],
          ),
        ),
      ],
    );
  }
}
