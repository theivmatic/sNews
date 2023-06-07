import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/data/data_api_impl.dart';
import 'package:snews/src/feature/presentation/bloc/all_news/all_news_event.dart';
import 'package:snews/src/feature/presentation/bloc/all_news/all_news_state.dart';

class AllNewsBloc extends Bloc<AllNewsEvent, AllNewsState> {
  AllNewsBloc() : super(AllNewsInitialState()) {
    on<FetchAllNewsEvent>((event, emit) async {
      try {
        final loaded = await ApiDataImpl().fetchAllNews(section: 'business');
        emit(AllNewsLoadedState(loaded: loaded));
      } catch (e) {
        emit(AllNewsErrorState(errorMsg: e.toString()));
      }
    });
  }
}
