import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/datasources.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required SearchDatasource datasource})
      : _datasource = datasource;

  final SearchDatasource _datasource;

  @override
  Future<Either<AppError, List<MovieEntity>>> getMoviesSearched(
      String query) async {
    try {
      final List<MovieEntity> movies =
          await _datasource.getMoviesSearched(query);
      return right(movies);
    } on SocketException {
      return left(
        const AppError(AppErrorEnum.network),
      );
    } on Exception {
      return left(
        const AppError(AppErrorEnum.api),
      );
    }
  }
}
