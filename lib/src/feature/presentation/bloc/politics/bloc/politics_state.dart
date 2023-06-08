import 'package:snews/src/feature/domain/models/news/news.dart';

abstract class PoliticsNewsState {}

class PoliticsNewsInitialState extends PoliticsNewsState {}

class PoliticsNewsLoadedState extends PoliticsNewsState {
  final NewsEntity loaded;
  
  PoliticsNewsLoadedState({required this.loaded});
}

class PoliticsNewsLoadingState extends PoliticsNewsState {}

class PoliticsNewsErrorState extends PoliticsNewsState {
  String? errorMessage;
  int? errorCode;
  PoliticsNewsErrorState({this.errorCode, this.errorMessage});
}