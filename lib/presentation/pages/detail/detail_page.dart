import 'package:flutter/material.dart';

import '../../../data/model/common.dart';
import '../../../data/model/hit.dart';
import '../../../data/model/snippet.dart';
import '../../providers/style.dart';
import '../../widgets/highlighted_text.dart';
import '../../widgets/texts.dart';
import 'widgets/header_row.dart';
import 'widgets/header_summary.dart';
import 'widgets/related_buttons.dart';

class Detail extends StatelessWidget {
  final Hit item;

  const Detail({super.key, required this.item});

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

  Common get common => item.common;

  String? get documentNumber => int.parse(common.documentNumber).toString();

  String get title =>
      'Документ ${common.publishingOffice} $documentNumber ${common.kind}';

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(true),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Text(title, style: Styles.bold),
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
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HighlightedText(
                snippet.title,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              HeaderRow(item: item),
              const SizedBox(height: 20),
              HeaderSummary(item: item),
              const SizedBox(height: 20),
              Paragraph(header: 'Реферат', data: snippet.description),
              const SizedBox(height: 20),
              Paragraph(header: 'Формула', data: snippet.description),
              const SizedBox(height: 20),
              Paragraph(header: 'Описание', data: snippet.description),
              const SizedBox(height: 25),
              const RelatedButtons(),
            ],
          ),
        ),
      ]),
    );
  }
}
