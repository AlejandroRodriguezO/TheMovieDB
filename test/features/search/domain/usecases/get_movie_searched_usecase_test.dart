import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/search/domain/domain.dart';

import '../../../../helpers/helper.mocks.dart';

void main() {
  late GetMovieSearchedUsecase getMovieSearchedUsecase;
  late MockSearchRepository mockSearchRepository;

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    getMovieSearchedUsecase = GetMovieSearchedUsecase(
      repository: mockSearchRepository,
    );
  });

  const String query = 'Batman';

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

  test('should get Movies', () async {
    // arrange
    when(mockSearchRepository.getMoviesSearched(query)).thenAnswer(
        (_) async => const Right<AppError, List<MovieEntity>>(list));

    // act
    final Either<AppError, List<MovieEntity>> result =
        await getMovieSearchedUsecase(params: query);

    // assert
    expect(result, const Right<AppError, List<MovieEntity>>(list));
  });
}
