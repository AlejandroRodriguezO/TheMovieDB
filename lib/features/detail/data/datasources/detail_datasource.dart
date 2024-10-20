import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../models/models.dart';

abstract class DetailDatasource {
  Future<DetailModel> getDetailMovie(int id);
  Future<List<CreditModel>> getCreditMovie(int id);
}

class DetailDatasourceImpl implements DetailDatasource {
  DetailDatasourceImpl({required Dio client}) : _client = client;

  final Dio _client;
  @override
  Future<DetailModel> getDetailMovie(int id) async {
    final Response<dynamic> response = await _client.get(
      '${ApiUrls.detail}/$id',
    );

    return DetailModel.fromJson(response.data);
  }

  @override
  Future<List<CreditModel>> getCreditMovie(int id) async {
    final Response<dynamic> response = await _client.get(
      '${ApiUrls.detail}/$id/credits',
    );
    return (response.data['cast'] as List<dynamic>)
        .map((dynamic json) => CreditModel.fromJson(json))
        .toList();
  }
}
