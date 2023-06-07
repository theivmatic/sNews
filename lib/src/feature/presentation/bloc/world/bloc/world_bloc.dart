import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/data/data_api_impl.dart';
import 'package:snews/src/feature/presentation/bloc/world/bloc/world_event.dart';
import 'package:snews/src/feature/presentation/bloc/world/bloc/world_state.dart';

class WorldBloc extends Bloc<WorldEvent, WorldState> {
  WorldBloc() : super(WorldInitialState()) {
    on<FetchWorldNewsEvent>((event, emit) async {
      try {
        final loaded = await ApiDataImpl().fetchNews(section: 'world');
        emit(WorldLoadedState(loaded: loaded));
      } catch (e) {
        emit(WorldErrorState(errorMessage: e.toString()));
      }
    });
  }
}
