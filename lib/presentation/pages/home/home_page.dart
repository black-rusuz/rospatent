import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  void search() => context.read<HomeBloc>().add(HomeSearch('Лампа'));

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
                ),
                ElevatedButton(
                  onPressed: search,
                  child: const Text('Search'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
