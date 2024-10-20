import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/core/di/di.dart';
import 'package:the_movie_db/features/features.dart';

void main() {
  setUp(() async {
    await initializeDependencies();
  });

  test('Injection container test', () {
    locator.get<Dio>();
    locator.get<SearchDatasource>();
    locator.get<SearchRepository>();
    locator.get<GetMovieSearchedUsecase>();
    locator.get<SearchCubit>();
    locator.get<DetailDatasource>();
    locator.get<DetailRepository>();
    locator.get<GetCreditMovieUsecase>();
    locator.get<GetDetailMovieUsecase>();
    locator.get<DetailMovieCubit>();
  });
}
