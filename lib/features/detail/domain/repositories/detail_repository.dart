import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';

abstract class DetailRepository {
  Future<Either<AppError, DetailEntity>> getDetailMovie(int id);
  Future<Either<AppError, List<CreditEntity>>> getCreditMovie(int id);
}
