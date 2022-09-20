import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../data/model/hit.dart';
import '../pages/detail/detail_page.dart';

class ResultItem extends StatelessWidget {
  final Hit item;

  const ResultItem({super.key, required this.item});

  static const TextStyle textStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Color.fromRGBO(185, 185, 197, 1),
  );

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
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.06),
                blurRadius: 60,
                offset: Offset(0, 60),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.0413989),
                blurRadius: 20,
                offset: Offset(0, 20),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.0333774),
                blurRadius: 10,
                offset: Offset(0, 10),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.0266226),
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.0186011),
                blurRadius: 2,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Html(
                data: item.snippet.title,
                style: {
                  'em': Style(
                    backgroundColor: const Color(0xfffaff00),
                    fontStyle: FontStyle.normal,
                  ),
                  '*:not(em)': Style(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(0, 84, 166, 1),
                  ),
                  'body': Style(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                  ),
                },
              ),
              const SizedBox(height: 10),
              Text(
                'МПК ${item.snippet.classification.toString()}',
                style: textStyle,
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.feed_rounded, size: 15),
                  const SizedBox(width: 5),
                  Expanded(child: Text(item.id, style: textStyle)),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.people_alt, size: 15),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(item.snippet.applicant, style: textStyle),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.person, size: 15),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(item.snippet.inventor, style: textStyle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
