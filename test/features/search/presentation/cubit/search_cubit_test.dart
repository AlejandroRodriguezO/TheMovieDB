import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/search/search.dart';

import '../../../../helpers/helper.mocks.dart';

void main() {
  late SearchCubit searchCubit;
  late MockGetMovieSearchedUsecase mockGetMovieSearchedUsecase;

  setUp(() {
    mockGetMovieSearchedUsecase = MockGetMovieSearchedUsecase();
    searchCubit = SearchCubit(
      searchedUsecase: mockGetMovieSearchedUsecase,
    );
  });

  tearDown(() => searchCubit.close());

  const List<MovieEntity> list = <MovieEntity>[
    MovieEntity(
      posterPath: 'posterPath',
      id: 0,
      backdropPath: 'backdropPath',
      title: 'title',
      voteAverage: 12,
      releaseDate: 'releaseDate',
    )
  ];

  test('initial state should be empty', () {
    expect(searchCubit.state, const SearchMovieInitial());
  });

  blocTest<SearchCubit, SearchState>(
    'reset state',
    build: () => searchCubit,
    act: (SearchCubit cubit) => cubit.reset(),
    expect: () => <SearchMovieInitial>[
      const SearchMovieInitial(),
    ],
  );

  blocTest<SearchCubit, SearchState>(
    'emits [SearchMovieLoading, SearchMovieLoaded] when search term is valid',
    build: () {
      when(mockGetMovieSearchedUsecase(params: anyNamed('params'))).thenAnswer(
        (_) async => const Right<AppError, List<MovieEntity>>(list),
      );

      return searchCubit;
    },
    act: (SearchCubit cubit) => cubit.searchTerm('test'),
    wait: const Duration(milliseconds: 600),
    expect: () => <Object>[
      const SearchMovieLoading(),
      isA<SearchMovieLoaded>().having(
          (SearchMovieLoaded state) => state.movies.length, 'movies length', 1),
    ],
  );

  blocTest<SearchCubit, SearchState>(
    'emits [SearchMovieLoading, SearchMovieFailed] when search fails',
    build: () {
      when(mockGetMovieSearchedUsecase(params: anyNamed('params'))).thenAnswer(
        (_) async =>
            const Left<AppError, List<MovieEntity>>(AppError(AppErrorEnum.api)),
      );

      return searchCubit;
    },
    act: (SearchCubit cubit) => cubit.searchTerm('test'),
    wait: const Duration(milliseconds: 600),
    expect: () => <Object>[
      const SearchMovieLoading(),
      const SearchMovieFailed(AppError(AppErrorEnum.api)),
    ],
  );
}
