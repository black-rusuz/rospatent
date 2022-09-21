import 'package:flutter/material.dart';

import '../providers/style.dart';
import '../widgets/highlighted_text.dart';

class PointGroup extends StatelessWidget {
  final String header;
  final List<String> values;

  const PointGroup({super.key, required this.header, required this.values});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$header:', style: Styles.bold),
        ...values.map((e) => Point(value: e)),
      ],
    );
  }
}

class Point extends StatelessWidget {
  final String? title;
  final String value;

  const Point({
    super.key,
    this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          if (title != null) TextSpan(text: '$title: ', style: Styles.bold),
          TextSpan(text: value, style: Styles.normal),
        ],
      ),
    );
  }
}

class IconPoint extends StatelessWidget {
  final IconData icon;
  final String data;

  const IconPoint(this.icon, this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 15),
        const SizedBox(width: 5),
        Expanded(child: Text(data, style: Styles.small)),
      ],
    );
  }
}

class Paragraph extends StatelessWidget {
  final String header;
  final String data;

  const Paragraph({super.key, required this.header, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: Styles.bold),
        const SizedBox(height: 8),
        HighlightedText(data, fontSize: 14),
      ],
    );
  }
}
