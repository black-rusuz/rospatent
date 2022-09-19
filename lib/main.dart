import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart' as di;
import 'injection.dart';
import 'presentation/pages/home/bloc/home_bloc.dart';
import 'presentation/pages/home/home_page.dart';

void setupApp() {
  di.configureDependencies();
}

void main() {
  setupApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rospatent',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<HomeBloc>(
        create: (_) => sl<HomeBloc>(),
        child: const HomePage(),
      ),
    );
  }
}
