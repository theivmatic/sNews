part of 'all_news_bloc.dart';

abstract class AllNewsState {}

class AllNewsInitialState extends AllNewsState {}

class AllNewsLoadedState extends AllNewsState {
  final AllNewsEntity loaded;

  AllNewsLoadedState({required this.loaded});
}

class AllNewsLoadingState extends AllNewsState {}

class AllNewsErrorState extends AllNewsState {
  String? errorMsg;
  int? errorCode;
  AllNewsErrorState({this.errorCode, this.errorMsg});
}
