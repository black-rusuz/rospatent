import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/model/hit.dart';
import '../pages/home/bloc/home_bloc.dart';
import '../providers/style.dart';
import 'result_item.dart';

class SearchResults extends StatelessWidget {
  final List<Hit> results;

  const SearchResults({super.key, required this.results});

  Widget mapResults(Hit item) => ResultItem(item: item);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // TODO: ЗА ЭТУ ПАРАШУ РАНЬШЕ СЖИГАЛИ
      backgroundColor: Style.background,
      onRefresh: () async => context.read<HomeBloc>().emit(HomeInitial()),
      child: ListView(
        children: [
          Text(
            'Всего найдено: ${results.length}',
            style: GoogleFonts.ptSans(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Style.primary),
          ),
          //TODO: Выводи в тексте total
          ...results.map(mapResults).toList()
        ],
      ),
    );
  }
}
