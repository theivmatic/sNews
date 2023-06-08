import 'package:snews/src/feature/domain/models/news/news.dart';

abstract class WorldState {}

class WorldInitialState extends WorldState {}

class WorldLoadedState extends WorldState {
  final NewsEntity loaded;

  WorldLoadedState({required this.loaded});
}

class WorldLoadingState extends WorldState {}

class WorldErrorState extends WorldState {
  int? statusCode;
  String? errorMessage;

  WorldErrorState({this.statusCode, this.errorMessage});
}
