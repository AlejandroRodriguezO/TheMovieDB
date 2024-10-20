import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/detail/detail.dart';

import '../../../../helpers/helper.mocks.dart';

void main() {
  late GetCreditMovieUsecase getCreditMovieUsecase;
  late MockDetailRepository mockDetailRepository;

  setUp(() {
    mockDetailRepository = MockDetailRepository();
    getCreditMovieUsecase = GetCreditMovieUsecase(
      repository: mockDetailRepository,
    );
  });

  const int id = 123456;

  const List<CreditEntity> credits = <CreditEntity>[
    CreditEntity(
      name: 'name',
      profilePath: 'profilePath',
      character: 'character',
    )
  ];

  test('should get Credits', () async {
    // arrange
    when(mockDetailRepository.getCreditMovie(id)).thenAnswer(
        (_) async => const Right<AppError, List<CreditEntity>>(credits));

    // act
    final Either<AppError, List<CreditEntity>> result =
        await getCreditMovieUsecase(params: id);

    // assert
    expect(result, const Right<AppError, List<CreditEntity>>(credits));
  });
}
