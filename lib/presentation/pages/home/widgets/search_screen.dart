part of '../home_page.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = TextEditingController(text: 'Лампа');

  void search() => context.read<HomeBloc>().add(HomeSearch(controller.text));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BaseTextField(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            controller: controller,
            placeholder: 'Что вы ищете?',
            icon: const Icon(Icons.search),
            onPressed: search,
          ),
          const HomeInfo(),
        ],
      ),
    );
  }
}

class HomeInfo extends StatelessWidget {
  const HomeInfo({super.key});

  static const TextStyle text = TextStyle(
    color: Styles.primary,
    fontSize: 12,
  );

  static const TextStyle number = TextStyle(
    color: Styles.accent,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic,
  );

  static const String firstPart =
      'Предоставляется возможность проведения поиска по мировому патентному фонду включающему';

  static const secondPart =
      'стран и организаций, в том числе все доступные русскоязычные массивы';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(firstPart, style: text),
          Text('26', style: number),
          Text(secondPart, style: text),
        ],
      ),
    );
  }
}
