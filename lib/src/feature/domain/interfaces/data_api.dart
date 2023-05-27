import 'package:snews/src/feature/domain/models/all_news/all_news_entity.dart';

abstract class IDataApi {
  Future<AllNewsEntity> fetchAllNews();
}
