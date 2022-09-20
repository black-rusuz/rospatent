import 'package:flutter/material.dart';

import '../../../data/model/hit.dart';
import '../../../data/model/snippet.dart';
import '../../providers/style.dart';

class Detail extends StatelessWidget {
  final Hit item;

  const Detail({super.key, required this.item});

  Snippet get info => item.snippet;

  static const TextStyle bold = TextStyle(
      fontSize: 12, fontWeight: FontWeight.bold, color: Style.primary);

  static const TextStyle normal = TextStyle(fontSize: 12, color: Style.primary);

  //TODO: сниппет - для карточки, мне нужно то, что в каммоне и только, ПЕРЕДЕЛАТЬ

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(true),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
            title: Text(
              // TODO: В гетер
              'Документ ${item.common.publishingOffice} ${item.common.documentNumber} ${item.common.kind}',
              style: bold.copyWith(fontSize: 14),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Text(info.title, style: bold),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('сделать'),
                          Text('сделать'),
                        ]),
                    Text(info.description, style: normal),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
