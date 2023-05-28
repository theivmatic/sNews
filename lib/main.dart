import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:snews/src/feature/presentation/bloc/all_news_bloc.dart';
import 'package:snews/src/feature/presentation/screens/main_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => AllNewsBloc()),
      ],
      builder: (context, child) => Builder(builder: (context) {
        return const MaterialApp(
          home: MainScreen(),
        );
      }),
    );
  }
}
