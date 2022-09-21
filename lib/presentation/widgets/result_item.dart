import 'package:flutter/material.dart';

import '../../data/model/hit.dart';
import '../../data/model/snippet.dart';
import '../pages/detail/detail_page.dart';
import '../providers/style.dart';
import 'highlighted_text.dart';
import 'texts.dart';

class ResultItem extends StatelessWidget {
  final Hit item;

  const ResultItem({super.key, required this.item});

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
                textColor: Styles.accent,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              Text('МПК ${snippet.classification}', style: Styles.small),
              const SizedBox(height: 4),
              IconPoint(Icons.feed_rounded, item.id),
              const SizedBox(height: 4),
              IconPoint(Icons.people_alt, snippet.applicant),
              const SizedBox(height: 4),
              IconPoint(Icons.person, snippet.inventor),
            ],
          ),
        ),
      ),
    );
  }
}
