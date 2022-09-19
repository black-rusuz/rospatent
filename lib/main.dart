import 'package:flutter/material.dart';

import 'injection.dart' as di;
import 'presentation/home_page.dart';

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
      home: const HomePage(),
    );
  }
}
