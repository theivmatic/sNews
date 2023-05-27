import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/all_news_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AllNewsBloc? allNewsBloc;

  @override
  void initState() {
    allNewsBloc = context.read<AllNewsBloc>()..add(FetchAllNewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNewsBloc, AllNewsState>(
      bloc: allNewsBloc,
      builder: (context, state) {
        if (state is AllNewsLoadedState) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                title: const Text('sNews'),
                centerTitle: true,
              ),
              body: ListView.builder(
                  itemCount: state.loaded.response!.docs!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Image.network(
                          'https://www.nytimes.com/${state.loaded.response!.docs![index].multimedia![index].url}'),
                    );
                  }),
            ),
          );
        }
        if (state is AllNewsErrorState) {
          return Scaffold(
            body: Center(
              child: Text(state.errorMsg ?? 'Some Error'),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
