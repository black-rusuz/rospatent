import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/hit.dart';
import '../pages/home/bloc/home_bloc.dart';
import '../providers/style.dart';
import 'result_item.dart';

class SearchResults extends StatelessWidget {
  final HomeResults state;

  const SearchResults(this.state, {super.key});

  Widget mapResults(Hit item) => ResultItem(item: item);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Style.background,
      onRefresh: () async => context.read<HomeBloc>().emit(HomeInitial()),
      child: ListView(
        children: [
          ResultsFound(state.total),
          const SizedBox(height: 15),
          ...state.results.map(mapResults).toList()
        ],
      ),
    );
  }
}

class ResultsFound extends StatelessWidget {
  final int total;

  const ResultsFound(this.total, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        'Всего найдено: $total',
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Style.primary,
        ),
      ),
    );
  }
}
