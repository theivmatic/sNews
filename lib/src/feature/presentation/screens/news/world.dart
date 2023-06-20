import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/world/world_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/world/world_event.dart';
import 'package:snews/src/feature/presentation/bloc/world/world_state.dart';
import 'package:snews/src/feature/presentation/widgets/error_alert.dart';
import 'package:snews/src/feature/presentation/widgets/news_card.dart';
import 'package:snews/src/feature/presentation/widgets/shimmer.dart';

class WorldScreen extends StatefulWidget {
  const WorldScreen({super.key});

  @override
  State<WorldScreen> createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen> {
  WorldNewsBloc? worldNewsBlock;

  @override
  void initState() {
    worldNewsBlock = context.read<WorldNewsBloc>()..add(FetchWorldNewsEvent());
    super.initState();
  }

  Widget showAlert() {
    return const ErrorAlertWidget();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorldNewsBloc, WorldNewsState>(
      bloc: worldNewsBlock,
      builder: (context, state) {
        if (state is WorldNewsLoadedState) {
          return Scaffold(
            body: ListView.separated(
              padding: const EdgeInsets.all(0.0),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal,
              ),
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
                return NewsCardWidget(
                  loaded: state.loaded.results![index],
                );
              },
            ),
          );
        }
        if (state is WorldNewsErrorState) {
          return showAlert();
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
