import 'package:flutter/cupertino.dart';
import 'package:flutter_html/flutter_html.dart';

import '../providers/style.dart';

class HighlightedText extends StatelessWidget {
  final String data;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;

  const HighlightedText(
    this.data, {
    super.key,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textAlign,
  });

  FontSize? get size => fontSize != null ? FontSize(fontSize) : null;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: data,
      style: {
        'em': Style(
          backgroundColor: const Color(0xFFc5e8ff),
          fontStyle: FontStyle.normal,
        ),
        '*:not(em)': Style(
          color: textColor ?? Styles.primaryDark,
          fontSize: size,
          fontWeight: fontWeight,
        ),
        'body': Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          textAlign: textAlign,
        ),
      },
    );
  }
}
