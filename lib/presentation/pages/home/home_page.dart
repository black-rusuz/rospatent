import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../providers/style.dart';
import '../../widgets/base_text_field.dart';
import '../../widgets/loader.dart';
import 'bloc/home_bloc.dart';
import 'widgets/search_results.dart';

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
