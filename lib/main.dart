import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'injection.dart' as di;
import 'injection.dart';
import 'presentation/pages/home/bloc/home_bloc.dart';
import 'presentation/pages/home/home_page.dart';
import 'presentation/providers/style.dart';

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
        primarySwatch: Style.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Style.secondary),
        ),
        iconTheme: const IconThemeData(color: Style.secondary),
        textTheme: GoogleFonts.ptSansTextTheme(),
      ),
      home: BlocProvider<HomeBloc>(
        create: (_) => sl<HomeBloc>(),
        child: const HomePage(),
      ),
    );
  }
}
