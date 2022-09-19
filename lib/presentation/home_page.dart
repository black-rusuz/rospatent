import 'package:flutter/material.dart';

import '../domain/i_search_api.dart';
import '../injection.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    print(sl<ISearchApi>());
    return const Scaffold(
      body: Center(child: Text('zalupa')),
    );
  }
}
