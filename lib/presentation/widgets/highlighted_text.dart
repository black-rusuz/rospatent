import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

import '../providers/style.dart';

class HighlightedText extends StatelessWidget {
  final String data;
  final Color? textColor;

  const HighlightedText(this.data, {super.key, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: data,
      style: {
        'em': Style(
          backgroundColor: const Color(0xfffaff00),
          fontStyle: FontStyle.normal,
        ),
        '*:not(em)': Style(
          fontWeight: FontWeight.bold,
          color: textColor ?? Styles.primary,
        ),
        'body': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          textAlign: TextAlign.center,
        ),
      },
    );
  }
}
