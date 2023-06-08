import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snews/src/feature/data/data_api_impl.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_event.dart';
import 'package:snews/src/feature/presentation/bloc/business/business_state.dart';

class BusinessNewsBloc extends Bloc<BusinessNewsEvent, BusinessNewsState> {
  BusinessNewsBloc() : super(BusinessNewsInitialState()) {
    on<FetchBusinessNewsEvent>((event, emit) async {
      try {
        final loaded = await ApiDataImpl().fetchNews(section: 'business');
        emit(BusinessNewsLoadedState(loaded: loaded));
      } catch (e) {
        emit(BusinessNewsErrorState(errorMessage: e.toString()));
      }
    });
  }
}
