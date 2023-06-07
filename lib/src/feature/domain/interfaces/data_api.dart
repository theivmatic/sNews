import 'package:snews/src/feature/domain/models/all_news/all_news.dart';

abstract class IDataApi {
  Future<AllNewsEntity> fetchNews({required String section});
}
