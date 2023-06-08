import 'package:snews/src/feature/domain/models/news/news.dart';

abstract class WorldNewsState {}

class WorldNewsInitialState extends WorldNewsState {}

class WorldNewsLoadedState extends WorldNewsState {
  final NewsEntity loaded;

  WorldNewsLoadedState({required this.loaded});
}

class WorldLoadingState extends WorldNewsState {}

class WorldNewsErrorState extends WorldNewsState {
  int? statusCode;
  String? errorMessage;

  WorldNewsErrorState({this.statusCode, this.errorMessage});
}
