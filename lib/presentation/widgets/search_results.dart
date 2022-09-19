import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/hit.dart';
import '../pages/home/bloc/home_bloc.dart';
import 'result_item.dart';

class SearchResults extends StatelessWidget {
  final List<Hit> results;

  const SearchResults({super.key, required this.results});

  Widget mapResults(Hit item) => ResultItem(item: item);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // TODO: ЗА ЭТУ ПАРАШУ РАНЬШЕ СЖИГАЛИ
      onRefresh: () async => context.read<HomeBloc>().emit(HomeInitial()),
      child: ListView(children: results.map(mapResults).toList()),
    );
  }
}
