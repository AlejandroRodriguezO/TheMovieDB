import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../../domain/usecases/usecases.dart';

part 'detail_movie_state.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  DetailMovieCubit(
      {required GetDetailMovieUsecase detailMovieUsecase,
      required GetCreditMovieUsecase creditMovieUsecase})
      : _detailMovieUsecase = detailMovieUsecase,
        _creditMovieUsecase = creditMovieUsecase,
        super(const DetailMovieState());

  final GetDetailMovieUsecase _detailMovieUsecase;
  final GetCreditMovieUsecase _creditMovieUsecase;

  Future<void> getMovieUseCase(int id) async {
    emit(
      state.copyWith(
        detailState: const DetailLoading(),
      ),
    );

    final Either<AppError, DetailEntity> result =
        await _detailMovieUsecase(params: id);

    result.fold(
      (AppError error) => emit(
        state.copyWith(
          detailState: DetailFailed(error: error),
        ),
      ),
      (DetailEntity detail) => emit(
        state.copyWith(
          detailState: DetailLoaded(movie: detail),
        ),
      ),
    );
  }

  Future<void> getCreditUseCase(int id) async {
    emit(
      state.copyWith(
        creditState: const CreditLoading(),
      ),
    );
    emit(
      state.copyWith(
        creditState: const CreditLoading(),
      ),
    );
    final Either<AppError, List<CreditEntity>> result =
        await _creditMovieUsecase(params: id);
    result.fold(
      (AppError error) => emit(
        state.copyWith(
          creditState: CreditFailed(error: error),
        ),
      ),
      (List<CreditEntity> credit) => emit(
        state.copyWith(
          creditState: CreditLoaded(credit: credit),
        ),
      ),
    );
  }
}
