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
              // appBar: AppBar(
              //   backgroundColor: Colors.white,
              //   title: const Text(
              //     'sNews',
              //     style: TextStyle(
              //       color: Colors.black,
              //       fontSize: 40,
              //       fontFamily: 'Ancient',
              //     ),
              //   ),
              //   centerTitle: true,
              //   leading: const Icon(
              //     Icons.menu,
              //     color: Colors.black,
              //     size: 25,
              //   ),
              //   actions: const [
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 15),
              //       child: Icon(
              //         Icons.account_circle,
              //         color: Colors.black,
              //         size: 35,
              //       ),
              //     )
              //   ],
              // ),
              body: ListView.builder(
                  itemCount: state.loaded.results!.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(10, 16, 10, 0),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(137, 240, 182, 182),
                            // border: Border.all(),
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            )),
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            SizedBox(
                              height: 150,
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: Image.network(state
                                  .loaded.results![index].multimedia![0].url
                                  .toString()),
                            ),
                            SizedBox(
                              width: 194,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Text(
                                  state.loaded.results![index].title.toString(),
                                  overflow: TextOverflow.ellipsis,
                                ),
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
