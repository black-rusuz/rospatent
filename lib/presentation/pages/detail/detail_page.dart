import 'package:flutter/material.dart';

import '../../../data/model/hit.dart';
import '../../../data/model/snippet.dart';
import '../../providers/style.dart';
import '../../widgets/highlighted_text.dart';

class Detail extends StatelessWidget {
  final Hit item;

  const Detail({super.key, required this.item});

  static const TextStyle normal = TextStyle(color: Styles.primary);

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
              const Text(
                'Реферат',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              HighlightedText(snippet.description, fontSize: 12),
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

  String get docNum => item.common.documentNumber.replaceAll('00000', '');

  @override
  Widget build(BuildContext context) {
    return Row(
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
                text: item.snippet.classification,
                style: Detail.boldAccent,
              ),
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
        Paragraph(
          title: 'Номер заявки',
          value: item.common.application.number,
          isActive: false,
        ),
        Paragraph(
          title: 'Дата подачи заявки',
          value: item.common.application.filingDate,
        ),
        Paragraph(
          title: 'Опубликовано',
          value: item.common.publicationDate,
        ),
        Values(header: 'Заявители', values: item.biblio.patentees),
        Values(header: 'Авторы', values: item.biblio.inventors),
        Values(header: 'Патентообладатели', values: item.biblio.patentees),
      ],
    );
  }
}

class Paragraph extends StatelessWidget {
  final String? title;
  final String value;
  final bool isActive;

  const Paragraph({
    super.key,
    this.title,
    required this.value,
    this.isActive = true,
  });

  Widget get text => RichText(
        text: TextSpan(
          children: [
            if (title != null) TextSpan(text: '$title: ', style: Detail.bold),
            TextSpan(text: value, style: Detail.normal),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return !isActive
        ? text
        : Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.search_rounded, size: 15, color: Styles.accent),
              const SizedBox(width: 5),
              text,
            ],
          );
  }
}

class Values extends StatelessWidget {
  final String header;
  final List<String> values;

  const Values({super.key, required this.header, required this.values});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$header:', style: Detail.bold),
        ...values.map((e) => Paragraph(value: e)),
      ],
    );
  }
}
