import 'package:snews/src/feature/domain/models/news/news.dart';

abstract class IDataApi {
  Future<NewsEntity> fetchNews({required String section});
}
