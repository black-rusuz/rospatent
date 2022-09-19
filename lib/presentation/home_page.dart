import 'package:flutter/material.dart';

import '../domain/search_api.dart';
import '../injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    sl<SearchApi>().search('ракета');
    return Scaffold(
      body: Center(
        child: Text(sl<SearchApi>().url),
      ),
    );
  }
}
