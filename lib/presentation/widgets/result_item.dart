import 'package:flutter/material.dart';

import '../../data/model/hit.dart';
import '../../data/model/snippet.dart';
import '../pages/detail/detail_page.dart';
import '../providers/style.dart';
import 'highlighted_text.dart';

class ResultItem extends StatelessWidget {
  final Hit item;

  const ResultItem({super.key, required this.item});

  static const TextStyle style = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(185, 185, 197, 1),
  );

  Snippet get snippet => item.snippet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Detail(item: item))),
        child: Ink(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: Styles.shadows,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HighlightedText(
                snippet.title,
                textColor: const Color.fromRGBO(0, 84, 166, 1),
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              Text('МПК ${snippet.classification}', style: style),
              const SizedBox(height: 4),
              Paragraph(Icons.feed_rounded, item.id),
              const SizedBox(height: 4),
              Paragraph(Icons.people_alt, snippet.applicant),
              const SizedBox(height: 4),
              Paragraph(Icons.person, snippet.inventor),
            ],
          ),
        ),
      ),
    );
  }
}

class Paragraph extends StatelessWidget {
  final IconData icon;
  final String data;

  const Paragraph(this.icon, this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 15),
        const SizedBox(width: 5),
        Expanded(child: Text(data, style: ResultItem.style)),
      ],
    );
  }
}
