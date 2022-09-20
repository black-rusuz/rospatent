import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../data/model/hit.dart';
import '../../../data/model/snippet.dart';
import '../../providers/style.dart';

class Detail extends StatelessWidget {
  final Hit item;

  const Detail({super.key, required this.item});

  static const TextStyle bold = TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Styles.primary);

  static const TextStyle normal =
      TextStyle(fontSize: 12, color: Styles.primary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.background,
      body: CustomScrollView(
        slivers: [
          _DetailAppBar(item: item, bold: bold),
          _DetailSliverList(item: item, bold: bold, normal: normal),
        ],
      ),
    );
  }
}

class _DetailAppBar extends StatelessWidget {
  final Hit item;
  final TextStyle bold;

  const _DetailAppBar({super.key, required this.item, required this.bold});

  String get title =>
      'Документ ${item.common.publishingOffice} ${item.common.documentNumber.replaceAll('00000', '')} ${item.common.kind}';

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(true),
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
      title: Text(
        title,
        style: bold.copyWith(fontSize: 14),
      ),
    );
  }
}

class _DetailSliverList extends StatelessWidget {
  final Hit item;
  final TextStyle bold;
  final TextStyle normal;

  const _DetailSliverList({
    super.key,
    required this.item,
    required this.bold,
    required this.normal,
  });

  Snippet get info => item.snippet;

  String get pubOffice => item.common.publishingOffice;

  String get docNum => item.common.documentNumber.replaceAll('00000', '');

  String get mpk => info.classification;

  String get kind => item.common.kind;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Html(
                data: info.title,
                style: {
                  'em': Style(
                    backgroundColor: const Color(0xfffaff00),
                    fontStyle: FontStyle.normal,
                  ),
                  '*:not(em)': Style(
                    fontWeight: FontWeight.bold,
                    color: Styles.primary,
                  ),
                  'body': Style(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    textAlign: TextAlign.center,
                  ),
                },
              ),
              const SizedBox(height: 8),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                RichText(
                  text: TextSpan(
                    text: pubOffice,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Styles.primary),
                    children: <TextSpan>[
                      TextSpan(
                          text: docNum,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Styles.accent,
                          )),
                      TextSpan(text: kind),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'МПК ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Styles.primary),
                    children: <TextSpan>[
                      //TODO: РУС ПОЧИНИ НЕ ПОКАЗЫВАЕТ
                      TextSpan(
                          text: mpk,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Styles.accent,
                          )),
                    ],
                  ),
                ),
              ]),
              const SizedBox(height: 5),
              Text(info.description, style: normal),
            ],
          ),
        ),
      ]),
    );
  }
}
