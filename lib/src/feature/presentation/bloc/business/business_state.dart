import 'package:snews/src/feature/domain/models/news/news.dart';

abstract class BusinessNewsState {}

class BusinessNewsInitialState extends BusinessNewsState {}

class BusinessNewsLoadedState extends BusinessNewsState {
  final NewsEntity loaded;

  BusinessNewsLoadedState({required this.loaded});
}

class BusinessNewsLoadingState extends BusinessNewsState {}

class BusinessNewsErrorState extends BusinessNewsState {
  String? errorMessage;
  int? errorCode;
  BusinessNewsErrorState({this.errorCode, this.errorMessage});
}
