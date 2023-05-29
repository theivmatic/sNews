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
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: ListView.builder(
                  itemCount: state.loaded.results!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 0),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            bottom: BorderSide(style: BorderStyle.solid),
                          ),
                          // borderRadius: BorderRadius.all(
                          //   Radius.circular(10),
                          // ),
                        ),
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            SizedBox(
                              height: 150,
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                child: Image.network(state
                                    .loaded.results![index].multimedia![0].url
                                    .toString()),
                              ),
                            ),
                            SizedBox(
                              width: 194,
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                                      overflow: TextOverflow.clip,
                                      style: const TextStyle(
                                        color: Color.fromRGBO(90, 90, 90, 1),
                                      ),
                                    ),
                                  ),

                                  // Хотел под текстом с описанием новости указать дату публикации,
                                  //но почему-то выдает null

                                  // Text(
                                  //   state.loaded.results![index].publishedDate
                                  //       .toString(),
                                  // ),


                                ],
                              ),
                            ),
                          ],
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
