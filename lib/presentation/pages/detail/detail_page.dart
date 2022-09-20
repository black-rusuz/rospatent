import 'package:flutter/material.dart';

import '../../../data/model/hit.dart';
import '../../../data/model/snippet.dart';
import '../../providers/style.dart';
import '../../widgets/highlighted_text.dart';

class Detail extends StatelessWidget {
  final Hit item;

  const Detail({super.key, required this.item});

  static const TextStyle bold =
      TextStyle(fontWeight: FontWeight.bold, color: Styles.primary);

  static TextStyle get boldAccent => bold.copyWith(color: Styles.accent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.background,
      body: CustomScrollView(
        slivers: [
          _DetailAppBar(item: item),
          _DetailSliverList(item: item),
        ],
      ),
    );
  }
}

class _DetailAppBar extends StatelessWidget {
  final Hit item;

  const _DetailAppBar({required this.item});

  String get title =>
      'Документ ${item.common.publishingOffice} ${item.common.documentNumber.replaceAll('00000', '')} ${item.common.kind}';

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(true),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Text(title, style: Detail.bold),
    );
  }
}

class _DetailSliverList extends StatelessWidget {
  final Hit item;

  const _DetailSliverList({required this.item});

  Snippet get snippet => item.snippet;

  String get docNum => item.common.documentNumber.replaceAll('00000', '');

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              HighlightedText(
                snippet.title,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: item.common.publishingOffice,
                      style: Detail.bold,
                      children: [
                        TextSpan(
                          text: docNum,
                          style: Detail.boldAccent,
                        ),
                        TextSpan(text: item.common.kind),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'МПК',
                      style: Detail.bold,
                      children: [
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: snippet.classification,
                          style: Detail.boldAccent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text('Реферат'),
              const SizedBox(height: 8),
              HighlightedText(snippet.description, fontSize: 12),
            ],
          ),
        ),
      ]),
    );
  }
}
