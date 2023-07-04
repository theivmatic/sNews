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
  WorldNewsBloc? worldNewsBloc;

  @override
  void initState() {
    worldNewsBloc = context.read<WorldNewsBloc>()..add(FetchWorldNewsEvent());
    super.initState();
  }

  Widget showAlert() {
    return ErrorAlertWidget(
      reloadScreen: () {
        worldNewsBloc!.add(FetchWorldNewsEvent());
        return ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(
                  Icons.signal_wifi_connected_no_internet_4_rounded,
                  color: Colors.white,
                ),
                SizedBox(width: 50),
                Text('Check your internet connection'),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _refresh() async {
    worldNewsBloc!.add(FetchWorldNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorldNewsBloc, WorldNewsState>(
      bloc: worldNewsBloc,
      builder: (context, state) {
        if (state is WorldNewsLoadedState) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: _refresh,
              backgroundColor: const Color.fromARGB(66, 160, 160, 160),
              color: Colors.black,
              child: ListView.separated(
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
