import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../constants/constants.dart';
import 'di.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(
        baseUrl: ApiUrls.baseUrl,
        headers: <String, String>{
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        queryParameters: <String, String>{
          'api_key': ApiUrls.apiKey,
          'language': 'es-CO',
        },
      ),
    ),
  );

  unawaited(searchDependencies());
  unawaited(detailDependencies());
}
