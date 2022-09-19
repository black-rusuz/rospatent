import 'package:flutter/material.dart';

import '../domain/i_search_api.dart';
import '../injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    sl<ISearchApi>().search('ракета');
    return Scaffold(
      body: Center(
        child: Text(sl<ISearchApi>().url),
      ),
    );
  }
}
