import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/politics/politics_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/politics/politics_event.dart';
import 'package:snews/src/feature/presentation/bloc/politics/politics_state.dart';
import 'package:snews/src/feature/presentation/widgets/news_card.dart';
import 'package:snews/src/feature/presentation/widgets/shimmer.dart';

class PoliticsScreen extends StatefulWidget {
  const PoliticsScreen({super.key});

  @override
  State<PoliticsScreen> createState() => _PoliticsScreenState();
}

class _PoliticsScreenState extends State<PoliticsScreen> {
  PoliticsNewsBloc? politicsNewsBloc;

  @override
  void initState() {
    politicsNewsBloc = context.read<PoliticsNewsBloc>()
      ..add(FetchPoliticsNewsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PoliticsNewsBloc, PoliticsNewsState>(
      bloc: politicsNewsBloc,
      builder: (context, state) {
        if (state is PoliticsNewsLoadedState) {
          return Scaffold(
            body: ListView.separated(
              padding: const EdgeInsets.all(0.0),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
              itemCount: state.loaded.results!.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: NewsCardWidget(
                      loaded: state.loaded.results![index],
                    ),
                  );
                }
                return NewsCardWidget(loaded: state.loaded.results![index]);
              },
            ),
          );
        }
        if (state is PoliticsNewsErrorState) {
          return Scaffold(
            body: Center(
              child: Text(state.errorMessage ?? 'Some Error'),
            ),
          );
        } else {
          return Scaffold(
            body: ListView.separated(
              padding: const EdgeInsets.all(0.0),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.normal),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const ShimmerWidget(height: 150);
              },
            ),
          );
        }
      },
    );
  }
}
