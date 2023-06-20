import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_bloc.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_event.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_state.dart';
import 'package:snews/src/feature/presentation/widgets/error_alert.dart';
import 'package:snews/src/feature/presentation/widgets/news_card.dart';
import 'package:snews/src/feature/presentation/widgets/shimmer.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({super.key});

  @override
  State<BusinessScreen> createState() => _BusinessScreenState();
}

class _BusinessScreenState extends State<BusinessScreen> {
  BusinessNewsBloc? businessNewsBloc;

  @override
  void initState() {
    businessNewsBloc = context.read<BusinessNewsBloc>()
      ..add(FetchBusinessNewsEvent());
    super.initState();
  }

  Widget showAlert() {
    return const ErrorAlertWidget();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessNewsBloc, BusinessNewsState>(
      bloc: businessNewsBloc,
      builder: (context, state) {
        if (state is BusinessNewsLoadedState) {
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
        if (state is BusinessNewsErrorState) {
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
                return const ShimmerWidget(height: 170);
              },
            ),
          );
        }
      },
    );
  }
}
