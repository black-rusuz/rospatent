import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../data/model/hit.dart';
import '../../../data/model/snippet.dart';
import '../../providers/style.dart';
import '../../widgets/base_button.dart';
import '../../widgets/base_selector.dart';
import '../../widgets/base_text_field.dart';
import '../../widgets/highlighted_text.dart';
import '../../widgets/loader.dart';
import '../../widgets/texts.dart';
import '../detail/detail_page.dart';
import 'bloc/home_bloc.dart';

part 'widgets/results_screen.dart';
part 'widgets/search_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.background,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) return const Loader();
          if (state is HomeResults) return ResultsScreen(state);
          return const SearchScreen();
        },
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final controller = TextEditingController(text: 'Лампа');

  void search() => context.read<HomeBloc>().add(HomeSearch(controller.text));

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      controller: controller,
      placeholder: 'Что вы ищете?',
      textInputAction: TextInputAction.search,
      icon: const Icon(Icons.search),
      onIconPressed: search,
    );
  }
}
