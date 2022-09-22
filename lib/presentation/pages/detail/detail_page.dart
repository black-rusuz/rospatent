import 'package:flutter/material.dart';

import '../../../data/model/hit.dart';
import '../../../data/model/snippet.dart';
import '../../providers/style.dart';
import '../../widgets/highlighted_text.dart';
import '../../widgets/texts.dart';
import '../../widgets/drawings.dart';
import '../../../data/model/drawings.dart';

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

  String get title =>
      'Документ ${item.common.publishingOffice} ${item.common.documentNumber.replaceAll('00000', '')} ${item.common.kind}';

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

  List<Drawing> get drawings => item.drawings;

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
              if (drawings.isNotEmpty) Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Drawings(data: drawings),
              ),
              const SizedBox(height: 20),
              Paragraph(header: 'Реферат', data: snippet.description),
              const SizedBox(height: 20),
              Paragraph(header: 'Формула', data: snippet.description),
              const SizedBox(height: 20),
              Paragraph(header: 'Описание', data: snippet.description),
            ],
          ),
        ),
      ]),
    );
  }
}

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
              TextSpan(text: ' $docNum', style: boldAccent),
              TextSpan(text: ' ${item.common.kind}'),
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

class HeaderSummary extends StatelessWidget {
  final Hit item;

  const HeaderSummary({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Point(
          title: 'Номер заявки',
          value: item.common.application.number,
        ),
        Point(
          title: 'Дата подачи заявки',
          value: item.common.application.filingDate,
        ),
        Point(
          title: 'Опубликовано',
          value: item.common.publicationDate,
        ),
        PointGroup(header: 'Заявители', values: item.biblio.patentees),
        PointGroup(header: 'Авторы', values: item.biblio.inventors),
        PointGroup(header: 'Патентообладатели', values: item.biblio.patentees),
      ],
    );
  }
}
