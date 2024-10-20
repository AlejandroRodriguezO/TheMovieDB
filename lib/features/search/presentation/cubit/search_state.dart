part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => <Object>[];
}

final class SearchMovieInitial extends SearchState {
  const SearchMovieInitial();
}

final class SearchMovieLoading extends SearchState {
  const SearchMovieLoading();
}

final class SearchMovieLoaded extends SearchState {
  const SearchMovieLoaded({this.movies =const <MovieEntity>[]});
  final List<MovieEntity> movies;

  @override
  List<Object> get props => <Object>[movies];
}

final class SearchMovieFailed extends SearchState {
  const SearchMovieFailed(this.error);
  final AppError error;

  @override
  List<Object> get props => <Object>[error];
}
