import 'dart:convert';
import 'package:snews/src/feature/domain/interfaces/data_api.dart';
import 'package:http/http.dart' as http;
import 'package:snews/src/feature/domain/models/all_news/all_news.dart';

class ApiDataImpl implements IDataApi {
  final http.Client? _client;

  ApiDataImpl({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<AllNewsEntity> fetchAllNews({required String section}) async {
    final response = await _client!.get(
      Uri.parse(
          'https://api.nytimes.com/svc/topstories/v2/$section.json?api-key=7G6FwHXsXDGLikbSgrCwcOHABUWIeTrc'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return AllNewsEntity.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception('Status Code: ${response.statusCode}');
    }
  }
}
