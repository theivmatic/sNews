import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/data/data_api_impl.dart';
import 'package:snews/src/feature/presentation/bloc/us/us_event.dart';
import 'package:snews/src/feature/presentation/bloc/us/us_state.dart';

class USNewsBloc extends Bloc<USNewsEvent, USNewsState> {
  USNewsBloc() : super(USNewsInitialState()) {
    on<USNewsEvent>(
      (event, emit) async {
        try {
          final loaded = await ApiDataImpl().fetchNews(section: 'US');
          emit(USNewsLoadedState(loaded: loaded));
        } catch (e) {
          emit(
            USNewsErrorState(
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}
