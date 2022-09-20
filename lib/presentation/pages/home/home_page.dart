import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/base_text_field.dart';
import '../../widgets/loader.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  void search() => context.read<HomeBloc>().add(HomeSearch(controller.text));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          print(state);
          if (state is HomeLoading) {
            return const Loader();
          }
          if (state is HomeResults) {}
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                BaseTextField(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  controller: controller,
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
