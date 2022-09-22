import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../data/model/common.dart';
import '../../../data/model/drawings.dart';
import '../../../data/model/hit.dart';
import '../../../data/model/snippet.dart';
import '../../providers/style.dart';
import '../../widgets/drawings.dart';
import '../../widgets/highlighted_text.dart';
import '../../widgets/texts.dart';
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

  SnackBar get snackBar => const SnackBar(
        content: Text('ID документа скопирован'),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
      );

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(true),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Row(
        children: [
          Text(title, style: Styles.bold),
          IconButton(
            icon: const Icon(Icons.content_copy_outlined, size: 20),
            onPressed: () =>
                Clipboard.setData(ClipboardData(text: item.id)).then(
              (value) {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailSliverList extends StatelessWidget {
  final Hit item;

  const _DetailSliverList({required this.item});

  Snippet get snippet => item.snippet;

  String? get documentNumber =>
      int.parse(item.common.documentNumber).toString();

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
              const SizedBox(height: 20),
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
              const SizedBox(height: 25),
              const RelatedButtons(),
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
