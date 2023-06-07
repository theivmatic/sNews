import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_event.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_state.dart';

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
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: ListView.separated(
                  padding: const EdgeInsets.all(0.0),
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  physics: const BouncingScrollPhysics(
                      decelerationRate: ScrollDecelerationRate.normal),
                  itemCount: state.loaded.results!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: [
                              SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                  child: Image.network(
                                    state.loaded.results![index].multimedia![0]
                                        .url
                                        .toString(),
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 194,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 5),
                                      child: Text(
                                        state.loaded.results![index].title
                                            .toString(),
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(18, 18, 18, 1),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 10),
                                      child: Text(
                                        state.loaded.results![index].abstract
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(90, 90, 90, 1),
                                        ),
                                        maxLines: 4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          );
        }
        if (state is AllNewsErrorState) {
          return Scaffold(
            body: Center(
              child: Text(state.errorMessage ?? 'Some Error'),
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
