import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/data/data_api_impl.dart';
import 'package:snews/src/feature/presentation/bloc/world/world_event.dart';
import 'package:snews/src/feature/presentation/bloc/world/world_state.dart';

class WorldNewsBloc extends Bloc<WorldNewsEvent, WorldNewsState> {
  WorldNewsBloc() : super(WorldNewsInitialState()) {
    on<FetchWorldNewsEvent>(
      (event, emit) async {
        try {
          final loaded = await ApiDataImpl().fetchNews(section: 'world');
          emit(WorldNewsLoadedState(loaded: loaded));
        } catch (e) {
          emit(
            WorldNewsErrorState(
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}
