import 'package:flutter/material.dart';

import '../../../../data/model/hit.dart';
import '../../../widgets/texts.dart';

extension FromatDate on String {
  String get formatDate => split('.').reversed.join('.');
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
        const SizedBox(height: 5),
        Point(
          title: 'Дата подачи заявки',
          value: item.common.application.filingDate.formatDate,
        ),
        const SizedBox(height: 5),
        Point(
          title: 'Опубликовано',
          value: item.common.application.filingDate.formatDate,
        ),
        const SizedBox(height: 20),
        PointGroup(header: 'Заявители', values: item.biblio.patentees),
        const SizedBox(height: 5),
        PointGroup(header: 'Авторы', values: item.biblio.inventors),
        const SizedBox(height: 5),
        PointGroup(header: 'Патентообладатели', values: item.biblio.patentees),
      ],
    );
  }
}
