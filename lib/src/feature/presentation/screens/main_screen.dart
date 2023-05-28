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
                backgroundColor: Colors.black54,
                title: const Text('sNews'),
                centerTitle: true,
              ),
              // body: ListView.builder(
              //     itemCount: state.loaded.response!.docs!.length,
              //     itemBuilder: (context, index) {
              //       // if (index == 3) {
              //       //   return const Text('3');
              //       // }
              //       return Padding(
              //         padding: const EdgeInsets.fromLTRB(10, 16, 10, 0),
              //         child: Container(
              //           decoration: const BoxDecoration(
              //             color: Color.fromARGB(137, 240, 182, 182),
              //             // border: Border.all(),
              //             borderRadius: BorderRadius.all(Radius.circular(5),)
              //           ),
              //           child: Wrap(
              //             direction: Axis.horizontal,
              //             children: [
              //               SizedBox(
              //                 height: 150,
              //                 width: MediaQuery.of(context).size.width / 2.2,
              //                 child: state.loaded.response?.docs?[index] != null
              //                     ? Image.network(
              //                         'https://www.nytimes.com/${state.loaded.response!.docs![index].multimedia![index].url}',
              //                       )
              //                     : const Icon(Icons.close),
              //               ),
              //               SizedBox(
              //                 width: 194,
              //                 child: Padding(
              //                   padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              //                   child: Text(
              //                     state.loaded.response!.docs![index].abstract
              //                         .toString(),
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     }),
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
