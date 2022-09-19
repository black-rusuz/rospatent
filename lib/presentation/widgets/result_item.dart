import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../data/model/hit.dart';

class ResultItem extends StatelessWidget {
  final Hit item;

  const ResultItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
      child: InkWell(
        // TODO: onTap
        onTap: () {},
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Html(
            //TODO: change font
            data: item.snippet.title,
            style: {
              'em': Style(
                backgroundColor: Colors.yellowAccent,
              ),
            },
          ),
        ),
      ),
    );
  }
}
