import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/detail/detail.dart';

import '../../../../helpers/helper.mocks.dart';
import '../../../../helpers/mocks/movie_detail_mock.dart';

void main() {
  late GetDetailMovieUsecase getDetailMovieUsecase;
  late MockDetailRepository mockDetailRepository;

  setUp(() {
    mockDetailRepository = MockDetailRepository();
    getDetailMovieUsecase = GetDetailMovieUsecase(
      repository: mockDetailRepository,
    );
  });

  const int id = 123456;



  test('should get Detail', () async {
    // arrange
    when(mockDetailRepository.getDetailMovie(id)).thenAnswer(
        (_) async => const Right<AppError, DetailEntity>(movieDetail));

    // act
    final Either<AppError, DetailEntity> result =
        await getDetailMovieUsecase(params: id);

    // assert
    expect(result, const Right<AppError, DetailEntity>(movieDetail));
  });
}
