import 'package:snews/src/feature/domain/models/all_news/all_news.dart';

abstract class WorldState {}

class WorldInitialState extends WorldState {}

class WorldLoadedState extends WorldState {
  final AllNewsEntity loaded;

  WorldLoadedState({required this.loaded});
}

class WorldLoadingState extends WorldState {}

class WorldErrorState extends WorldState {
  int? statusCode;
  String? errorMessage;

  WorldErrorState({this.statusCode, this.errorMessage});
}
