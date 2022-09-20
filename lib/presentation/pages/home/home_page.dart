import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../providers/style.dart';
import '../../widgets/base_text_field.dart';
import '../../widgets/home_info.dart';
import '../../widgets/loader.dart';
import '../../widgets/search_results.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.background,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) return const Loader();
          if (state is HomeResults) return SearchResults(state);
          return const HomeSearchField();
        },
      ),
    );
  }
}

class HomeSearchField extends StatefulWidget {
  const HomeSearchField({super.key});

  @override
  State<HomeSearchField> createState() => _HomeSearchFieldState();
}

class _HomeSearchFieldState extends State<HomeSearchField> {
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
