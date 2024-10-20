import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';

abstract interface class SearchRepository {
  Future<Either<AppError, List<MovieEntity>>> getMoviesSearched(String query);
}
