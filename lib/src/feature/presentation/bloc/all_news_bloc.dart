import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_news_event.dart';
part 'all_news_state.dart';

class AllNewsBloc extends Bloc<AllNewsEvent, AllNewsState> {
  AllNewsBloc() : super(AllNewsInitial()) {
    on<AllNewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
