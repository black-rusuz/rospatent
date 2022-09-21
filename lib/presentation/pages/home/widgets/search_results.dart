import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/hit.dart';
import '../../../../data/model/snippet.dart';
import '../../../providers/style.dart';
import '../../../widgets/highlighted_text.dart';
import '../../../widgets/texts.dart';
import '../../detail/detail_page.dart';
import '../bloc/home_bloc.dart';

class ResultsScreen extends StatelessWidget {
  final HomeResults state;

  const ResultsScreen(this.state, {super.key});

  Widget mapResults(Hit item) => ResultItem(item: item);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Styles.background,
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
          color: Styles.primary,
        ),
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  final Hit item;

  const ResultItem({super.key, required this.item});

  Snippet get snippet => item.snippet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
      child: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Detail(item: item))),
        child: Ink(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: Styles.shadows,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HighlightedText(
                snippet.title,
                textColor: Styles.accent,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              Text('МПК ${snippet.classification}', style: Styles.small),
              const SizedBox(height: 4),
              IconPoint(Icons.feed_rounded, item.id),
              const SizedBox(height: 4),
              IconPoint(Icons.people_alt, snippet.applicant),
              const SizedBox(height: 4),
              IconPoint(Icons.person, snippet.inventor),
            ],
          ),
        ),
      ),
    );
  }
}
