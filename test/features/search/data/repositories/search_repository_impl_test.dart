import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/core.dart';

import 'package:the_movie_db/features/search/search.dart';

import '../../../../helpers/helper.mocks.dart';

void main() {
  late MockSearchDatasource mockSearchDatasource;
  late SearchRepository searchRepository;

  setUp(() {
    mockSearchDatasource = MockSearchDatasource();
    searchRepository = SearchRepositoryImpl(
      datasource: mockSearchDatasource,
    );
  });
  const String query = 'Batman';

  const List<MovieModel> list = <MovieModel>[
    MovieModel(
      posterPath: 'posterPath',
      id: 0,
      backdropPath: 'backdropPath',
      title: 'title',
      voteAverage: 12,
      releaseDate: 'releaseDate',
    ),
  ];

  test(
    'should return search movie when a call to data source is successful',
    () async {
      // arrange
      when(mockSearchDatasource.getMoviesSearched(query))
          .thenAnswer((_) async => list);

      // act
      final Either<AppError, List<MovieEntity>> result =
          await searchRepository.getMoviesSearched(query);

      // assert
      expect(
        result,
        equals(const Right<AppError, List<MovieEntity>>(list)),
      );
    },
  );

  test(
    'should return connection failure when the device has no internet',
    () async {
      // arrange
      when(mockSearchDatasource.getMoviesSearched(query))
          .thenThrow(const SocketException('Failed to connect to the network'));

      // act
      final Either<AppError, List<MovieEntity>> result =
          await searchRepository.getMoviesSearched(query);

      // assert
      expect(
        result,
        equals(
          const Left<AppError, List<MovieEntity>>(
            AppError(AppErrorEnum.network),
          ),
        ),
      );
    },
  );

  test(
    'should return server failure when a call to data source is unsuccessful',
    () async {
      // arrange
      when(mockSearchDatasource.getMoviesSearched(query))
          .thenThrow(Exception('Failed to API Error'));

      // act
      final Either<AppError, List<MovieEntity>> result =
          await searchRepository.getMoviesSearched(query);

      // assert
      expect(
        result,
        equals(
          const Left<AppError, List<MovieEntity>>(
            AppError(AppErrorEnum.api),
          ),
        ),
      );
    },
  );
}
