import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/home/bloc/home_bloc.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onDoubleTap: () => context.read<HomeBloc>().emit(HomeInitial()),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
