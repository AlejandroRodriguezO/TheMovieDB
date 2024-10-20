import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../repositories/repositories.dart';

class GetMovieSearchedUsecase
    implements UseCase<Either<AppError, List<MovieEntity>>, String> {
  GetMovieSearchedUsecase({required SearchRepository repository})
      : _repository = repository;

  final SearchRepository _repository;

  @override
  Future<Either<AppError, List<MovieEntity>>> call({String? params}) =>
      _repository.getMoviesSearched(params!);
}
