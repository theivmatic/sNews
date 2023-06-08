import 'package:snews/src/feature/domain/models/news/news.dart';

abstract class USNewsState {}

class USNewsInitialState extends USNewsState {}

class USNewsLoadedState extends USNewsState {
  final NewsEntity loaded;

  USNewsLoadedState({required this.loaded});
}

class USNewsLoadingState extends USNewsState {}

class USNewsErrorState extends USNewsState {
  String? errorMessage;
  int? errorCode;
  USNewsErrorState({this.errorCode, this.errorMessage});
}