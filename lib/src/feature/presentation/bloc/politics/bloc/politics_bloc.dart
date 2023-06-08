import 'package:bloc/bloc.dart';
import 'package:snews/src/feature/data/data_api_impl.dart';
import 'package:snews/src/feature/presentation/bloc/politics/bloc/politics_event.dart';
import 'package:snews/src/feature/presentation/bloc/politics/bloc/politics_state.dart';

class PoliticsNewsBloc extends Bloc<PoliticsNewsEvent, PoliticsNewsState> {
  PoliticsNewsBloc() : super(PoliticsNewsInitialState()) {
    on<FetchPoliticsNewsEvent>(
      (event, emit) async {
        try {
          final loaded = await ApiDataImpl().fetchNews(section: 'politics');
          emit(PoliticsNewsLoadedState(loaded: loaded));
        } catch (e) {
          emit(
            PoliticsNewsErrorState(
              errorMessage: e.toString(),
            ),
          );
        }
      },
    );
  }
}
