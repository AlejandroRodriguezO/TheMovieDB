import '../../features/detail/detail.dart';

import 'di.dart';

Future<void> detailDependencies() async {
  locator
    ..registerLazySingleton<DetailDatasource>(
      () => DetailDatasourceImpl(
        client: locator(),
      ),
    )
    ..registerLazySingleton<DetailRepository>(
      () => DetailRepositoryImpl(
        datasource: locator(),
      ),
    )
    ..registerLazySingleton<GetCreditMovieUsecase>(
      () => GetCreditMovieUsecase(
        repository: locator(),
      ),
    )
    ..registerLazySingleton<GetDetailMovieUsecase>(
      () => GetDetailMovieUsecase(
        repository: locator(),
      ),
    )
    ..registerFactory<DetailMovieCubit>(
      () => DetailMovieCubit(
        detailMovieUsecase: locator(),
        creditMovieUsecase: locator(),
      ),
    );
}
