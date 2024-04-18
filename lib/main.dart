import 'package:flutter/material.dart';

import 'config/config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  MovieApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Movie App',
      theme: flexSchemeDark,
      routerConfig: _appRouter.config(),
    );
  }
}