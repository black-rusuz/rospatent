import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/model/hit.dart';
import '../pages/detail/detail_page.dart';

class ResultItem extends StatelessWidget {
  final Hit item;

  const ResultItem({super.key, required this.item});

  TextStyle get textStyle => GoogleFonts.ptSans(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: const Color.fromRGBO(185, 185, 197, 1),
        //TODO: Русик почини стайл и поменяй цвет
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
      child: InkWell(
        // TODO: onTap
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Detail(item: item))),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Html(
                //TODO: change font
                data: item.snippet.title,
                style: {
                  'em': Style(
                    backgroundColor: Colors.yellowAccent,
                  ),
                },
              ),
              Text(item.snippet.classification.toString(), style: textStyle),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.feed_rounded, size: 15),
                  const SizedBox(width: 5),
                  Text(item.id, style: textStyle),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.people_alt, size: 15),
                  const SizedBox(width: 5),
                  Text(item.snippet.applicant, style: textStyle),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  const Icon(Icons.person, size: 15),
                  const SizedBox(width: 5),
                  Text(item.snippet.inventor, style: textStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
