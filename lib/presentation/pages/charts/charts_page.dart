import 'package:flutter/material.dart';

import '../../providers/style.dart';

class ChartsPage extends StatelessWidget {
  final String pattern;

  const ChartsPage({super.key, required this.pattern});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(true),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Запрос $pattern'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
