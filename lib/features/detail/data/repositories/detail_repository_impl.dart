import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/datasources.dart';
import '../models/models.dart';

class DetailRepositoryImpl implements DetailRepository {
  DetailRepositoryImpl({required DetailDatasource datasource})
      : _datasource = datasource;

  final DetailDatasource _datasource;
  @override
  Future<Either<AppError, List<CreditModel>>> getCreditMovie(int id) async {
    try {
      final List<CreditModel> result = await _datasource.getCreditMovie(id);
      return right(result);
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

  @override
  Future<Either<AppError, DetailModel>> getDetailMovie(int id) async {
    try {
      final DetailModel result = await _datasource.getDetailMovie(id);
      return right(result);
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
