import 'package:flutter/material.dart';

import '../../../widgets/base_button.dart';

class RelatedButtons extends StatelessWidget {
  const RelatedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      // TODO: actions
      children: [
        BaseButton(
          title: 'Похожие документы',
          onTap: () {},
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: BaseButton(
                title: 'Предыдущий документ',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 11),
            Expanded(
              child: BaseButton(
                title: 'Следующий документ',
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }
}
