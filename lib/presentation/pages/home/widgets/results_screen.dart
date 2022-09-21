part of '../home_page.dart';

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
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 15),
            child: SearchField(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: ResultsFound(state.total),
          ),
          ...state.results.map(mapResults),
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
