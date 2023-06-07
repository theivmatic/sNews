import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/data/data_api_impl.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_event.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_state.dart';

class AllNewsBloc extends Bloc<AllNewsEvent, AllNewsState> {
  AllNewsBloc() : super(AllNewsInitialState()) {
    on<FetchAllNewsEvent>((event, emit) async {
      try {
        final loaded = await ApiDataImpl().fetchNews(section: 'business');
        emit(AllNewsLoadedState(loaded: loaded));
      } catch (e) {
        emit(AllNewsErrorState(errorMessage: e.toString()));
      }
    });
  }
}
