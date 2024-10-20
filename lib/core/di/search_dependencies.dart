import '../../features/search/search.dart';
import 'di.dart';

Future<void> searchDependencies() async {
  locator
    ..registerLazySingleton<SearchDatasource>(
      () => SearchDatasourceImpl(
        client: locator(),
      ),
    )
    ..registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(
        datasource: locator(),
      ),
    )
    ..registerLazySingleton<GetMovieSearchedUsecase>(
      () => GetMovieSearchedUsecase(
        repository: locator(),
      ),
    )
    ..registerFactory<SearchCubit>(
      () => SearchCubit(
        searchedUsecase: locator(),
      ),
    );
}
