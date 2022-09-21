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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Pagination(currentPage: state.currentPage),
          ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseButton(
            // TODO: onTap
            onTap: () {},
            icon: Icons.settings_rounded,
            title: 'Расширенный поиск',
          ),
          const SizedBox(height: 5),
          BaseButton(
            // TODO: onTap
            onTap: () {},
            icon: Icons.insert_chart_outlined_rounded,
            title: 'Визуализация',
          ),
          const SizedBox(height: 10),
          const BaseSelector(
            // TODO: values
            values: [
              'Lorem Ipsum',
              'Heart of a Coward',
              'System of a Down',
              'GlassLands',
              'The Browning',
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Всего найдено: $total',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Styles.primaryDark,
            ),
          ),
        ],
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  final Hit item;

  const ResultItem({super.key, required this.item});

  Snippet get snippet => item.snippet;

  BorderRadius get radius => BorderRadius.circular(10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 15),
      child: InkWell(
        customBorder: RoundedRectangleBorder(borderRadius: radius),
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Detail(item: item))),
        child: Ink(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radius,
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

class Pagination extends StatelessWidget {
  final int currentPage;

  const Pagination({super.key, required this.currentPage});

  List<int> get pages => currentPage < 4
      ? List<int>.generate(7, (e) => e + 1)
      : [
          ...List.generate(3, (e) => currentPage - 1 - e).reversed,
          currentPage,
          ...List.generate(3, (e) => currentPage + 1 + e),
        ];

  bool isActive(int number) => number == currentPage;

  Widget mapPages(int number) => PageItem(number, isActive: isActive(number));

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pages.map(mapPages).toList(),
    );
  }
}

class PageItem extends StatelessWidget {
  final int number;
  final bool isActive;

  const PageItem(this.number, {super.key, required this.isActive});

  BorderRadius get radius => BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: () => context.read<HomeBloc>().add(HomeSetPage(number)),
        customBorder: RoundedRectangleBorder(borderRadius: radius),
        child: Ink(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isActive ? Styles.accent : Colors.transparent,
            borderRadius: radius,
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : Styles.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
