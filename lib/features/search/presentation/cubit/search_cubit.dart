import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../domain/usecases/usecases.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required GetMovieSearchedUsecase searchedUsecase})
      : _searchedUsecase = searchedUsecase,
        super(const SearchMovieInitial());

  final GetMovieSearchedUsecase _searchedUsecase;

  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  Future<void> searchTerm(String query) async {
    emit(const SearchMovieLoading());
    if (query.length > 2) {
      _debouncer.run(() async {
        final Either<AppError, List<MovieEntity>> result =
            await _searchedUsecase(params: query);

        result.fold(
          (AppError error) => emit(
            SearchMovieFailed(error),
          ),
          (List<MovieEntity> movies) => emit(
            SearchMovieLoaded(movies: movies),
          ),
        );
      });
    }
  }

  void reset() {
    emit(const SearchMovieInitial());
  }

  @override
  Future<void> close() {
    _debouncer.cancel();
    return super.close();
  }
}
