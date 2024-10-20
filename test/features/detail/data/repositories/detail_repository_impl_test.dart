import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/detail/detail.dart';

import '../../../../helpers/helper.mocks.dart';

void main() {
  late MockDetailDatasource mockDetailDatasource;
  late DetailRepository detailRepository;

  setUp(() {
    mockDetailDatasource = MockDetailDatasource();
    detailRepository = DetailRepositoryImpl(
      datasource: mockDetailDatasource,
    );
  });
  const int id = 123456;
  group('get detail movie', () {
    const DetailModel detailModel = DetailModel(
      title: 'title',
      posterPath: 'posterPath',
      overview: 'overview',
      releaseDate: 'releaseDate',
      genres: <GenreEntity>[
        GenreModel(name: 'name'),
      ],
    );

    test(
      'should return detail movie when a call to data source is successful',
      () async {
        // arrange
        when(mockDetailDatasource.getDetailMovie(id))
            .thenAnswer((_) async => detailModel);

        // act
        final Either<AppError, DetailEntity> result =
            await detailRepository.getDetailMovie(id);

        // assert
        expect(result, equals(const Right<AppError, DetailModel>(detailModel)));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockDetailDatasource.getDetailMovie(id)).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final Either<AppError, DetailEntity> result =
            await detailRepository.getDetailMovie(id);

        // assert
        expect(
          result,
          equals(
            const Left<AppError, DetailEntity>(
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
        when(mockDetailDatasource.getDetailMovie(id))
            .thenThrow(Exception('Failed to API Error'));

        // act
        final Either<AppError, DetailEntity> result =
            await detailRepository.getDetailMovie(id);

        // assert
        expect(
          result,
          equals(
            const Left<AppError, DetailEntity>(
              AppError(AppErrorEnum.api),
            ),
          ),
        );
      },
    );
  });

  group('get credit movie', () {
    const List<CreditModel> credits = <CreditModel>[
      CreditModel(
        name: 'name',
        profilePath: 'profilePath',
        character: 'character',
      )
    ];

    test(
      'should return detail movie when a call to data source is successful',
      () async {
        // arrange
        when(mockDetailDatasource.getCreditMovie(id))
            .thenAnswer((_) async => credits);

        // act
        final Either<AppError, List<CreditEntity>> result =
            await detailRepository.getCreditMovie(id);

        // assert
        expect(
            result, equals(const Right<AppError, List<CreditEntity>>(credits)));
      },
    );

    test(
      'should return connection failure when the device has no internet',
      () async {
        // arrange
        when(mockDetailDatasource.getCreditMovie(id)).thenThrow(
            const SocketException('Failed to connect to the network'));

        // act
        final Either<AppError, List<CreditEntity>> result =
            await detailRepository.getCreditMovie(id);

        // assert
        expect(
          result,
          equals(
            const Left<AppError, List<CreditEntity>>(
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
        when(mockDetailDatasource.getCreditMovie(id))
            .thenThrow(Exception('Failed to API Error'));

        // act
        final  Either<AppError, List<CreditEntity>> result =
            await detailRepository.getCreditMovie(id);

        // assert
        expect(
          result,
          equals(
            const Left<AppError, List<CreditEntity>>(
              AppError(AppErrorEnum.api),
            ),
          ),
        );
      },
    );
  });
}
