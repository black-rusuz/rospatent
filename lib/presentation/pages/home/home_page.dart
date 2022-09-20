import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../providers/style.dart';
import '../../widgets/base_text_field.dart';
import '../../widgets/loader.dart';
import '../../widgets/search_results.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  //TODO:
  void search() => context.read<HomeBloc>().add(const HomeSearch('Лампа'));

  TextStyle get textStyle => GoogleFonts.ptSans(
      fontSize: 12, fontWeight: FontWeight.bold, color: Style.primary);

  String get firstPart =>
      'Предоставляется возможность проведения поиска по мировому патентному фонду включающему';
  String get secondPart =>
      'стран и организаций, в том числе все доступные русскоязычные массивы';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Loader();
          }
          if (state is HomeResults) {
            return SearchResults(results: state.results);
          }
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BaseTextField(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  controller: controller,
                  placeholder: 'Что вы ищите?',
                  icon: Icon(Icons.search),
                  onPressed: search,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(firstPart, style: textStyle),
                      Text('26',
                          style: GoogleFonts.ptSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Style.accent)),
                      Text(secondPart, style: textStyle),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
