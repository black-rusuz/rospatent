part of '../home_page.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: SvgPicture.asset(
            'assets/img/background.svg',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              SearchField(),
              HomeInfo(),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.1,
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1,
          child: SvgPicture.asset('assets/img/branding.svg'),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset('assets/img/logo.svg'),
        ),
      ],
    );
  }
}

class HomeInfo extends StatelessWidget {
  const HomeInfo({super.key});

  static const TextStyle text = TextStyle(
    color: Styles.primaryDark,
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
