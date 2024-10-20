import 'package:dio/dio.dart';

import '../../../../core/core.dart';

abstract interface class SearchDatasource {
  Future<List<MovieModel>> getMoviesSearched(String movie);
}

class SearchDatasourceImpl implements SearchDatasource {
  SearchDatasourceImpl({required Dio client}) : _client = client;

  final Dio _client;

  @override
  Future<List<MovieModel>> getMoviesSearched(String movie) async {
    final Response<dynamic> response = await _client.get(
      ApiUrls.search,
      queryParameters: <String, dynamic>{
        'query': movie,
      },
    );

    return (response.data['results'] as List<dynamic>)
        .map((dynamic json) => MovieModel.fromJson(json))
        .toList();
  }
}
