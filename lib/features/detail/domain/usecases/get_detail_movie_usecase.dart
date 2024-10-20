import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetDetailMovieUsecase
    implements UseCase<Either<AppError, DetailEntity>, int> {
  GetDetailMovieUsecase({required DetailRepository repository})
      : _repository = repository;

  final DetailRepository _repository;

  @override
  Future<Either<AppError, DetailEntity>> call({int? params}) =>
      _repository.getDetailMovie(params!);
}
