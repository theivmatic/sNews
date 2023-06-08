import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/observer.dart';
import 'package:snews/src/feature/presentation/bloc/politics/politics_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/us/us_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/world/world_bloc.dart';
import 'package:snews/src/feature/presentation/widgets/hidden_drawer.dart';

void main() {
  Bloc.observer = AppObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (context) => BusinessNewsBloc()),
        BlocProvider(create: (context) => WorldNewsBloc()),
        BlocProvider(create: (context) => PoliticsNewsBloc()),
        BlocProvider(create: (context) => USNewsBloc()),
      ],
      builder: (context, child) => Builder(
        builder: (context) {
          // TODO: and here it is necessary
          return MaterialApp(
            // debugShowCheckedModeBanner: false,
            home: const HiddenDrawer(),
            theme: ThemeData(primaryColor: Colors.white),
          );
        },
      ),
    );
  }
}
