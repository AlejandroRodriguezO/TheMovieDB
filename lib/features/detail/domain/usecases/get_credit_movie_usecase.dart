import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';
import '../repositories/repositories.dart';

class GetCreditMovieUsecase
    implements UseCase<Either<AppError, List<CreditEntity>>, int> {
  GetCreditMovieUsecase({required DetailRepository repository})
      : _repository = repository;

  final DetailRepository _repository;

  @override
  Future<Either<AppError, List<CreditEntity>>> call({int? params}) =>
      _repository.getCreditMovie(params!);
}
