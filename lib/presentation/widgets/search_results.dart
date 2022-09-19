import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/hit.dart';
import '../pages/home/bloc/home_bloc.dart';

class SearchResults extends StatelessWidget {
  final List<Hit> results;

  const SearchResults({super.key, required this.results});

  Widget mapResults(Hit item) => ResultItem(item: item);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () async => context.read<HomeBloc>().emit(HomeInitial()),
        child: ListView(children: results.map(mapResults).toList()));
  }
}

class ResultItem extends StatelessWidget {
  final Hit item;

  const ResultItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
      child: InkWell(
        // TODO: onTap
        onTap: () {},
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(item.snippet.title),
        ),
      ),
    );
  }
}
