import 'package:snews/src/feature/domain/models/all_news/all_news.dart';

abstract class AllNewsState {}

class AllNewsInitialState extends AllNewsState {}

class AllNewsLoadedState extends AllNewsState {
  final AllNewsEntity loaded;

  AllNewsLoadedState({required this.loaded});
}

class AllNewsLoadingState extends AllNewsState {}

class AllNewsErrorState extends AllNewsState {
  String? errorMessage;
  int? errorCode;
  AllNewsErrorState({this.errorCode, this.errorMessage});
}
