import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/detail/detail.dart';

import '../../../../helpers/helper.mocks.dart';
import '../../../../helpers/mocks/movie_detail_mock.dart';

void main() {
  late DetailMovieCubit detailMovieCubit;
  late MockGetDetailMovieUsecase mockGetDetailMovieUsecase;
  late MockGetCreditMovieUsecase mockGetCreditMovieUsecase;

  setUp(() {
    mockGetDetailMovieUsecase = MockGetDetailMovieUsecase();
    mockGetCreditMovieUsecase = MockGetCreditMovieUsecase();
    detailMovieCubit = DetailMovieCubit(
      detailMovieUsecase: mockGetDetailMovieUsecase,
      creditMovieUsecase: mockGetCreditMovieUsecase,
    );
  });

  tearDown(() => detailMovieCubit.close());

  const int id = 123456;


  const List<CreditEntity> list = <CreditEntity>[
    CreditEntity(
      name: 'name',
      profilePath: 'profilePath',
      character: 'character',
    )
  ];
  test('initial state should be empty', () {
    expect(detailMovieCubit.state, const DetailMovieState());
  });

  group('Get detail movie test', () {
    blocTest<DetailMovieCubit, DetailMovieState>(
      'should emit detail loaded',
      build: () {
        when(mockGetDetailMovieUsecase(params: id)).thenAnswer(
          (_) async => const Right<AppError, DetailEntity>(movieDetail),
        );
        return detailMovieCubit;
      },
      act: (DetailMovieCubit cubit) => cubit.getMovieUseCase(id),
      expect: () => <DetailMovieState>[
        const DetailMovieState(detailState: DetailLoading()),
        const DetailMovieState(detailState: DetailLoaded(movie: movieDetail)),
      ],
    );
    blocTest<DetailMovieCubit, DetailMovieState>(
      'should emit detail failed',
      build: () {
        when(mockGetDetailMovieUsecase(params: id)).thenAnswer(
          (_) async =>
              const Left<AppError, DetailEntity>(AppError(AppErrorEnum.api)),
        );
        return detailMovieCubit;
      },
      act: (DetailMovieCubit cubit) => cubit.getMovieUseCase(id),
      expect: () => <DetailMovieState>[
        const DetailMovieState(detailState: DetailLoading()),
        const DetailMovieState(
            detailState: DetailFailed(error: AppError(AppErrorEnum.api))),
      ],
    );
  });

  group('Get credit movie test', () {
    blocTest<DetailMovieCubit, DetailMovieState>(
      'should emit credit loaded',
      build: () {
        when(mockGetCreditMovieUsecase(params: id)).thenAnswer(
          (_) async => const Right<AppError, List<CreditEntity>>(list),
        );
        return detailMovieCubit;
      },
      act: (DetailMovieCubit cubit) => cubit.getCreditUseCase(id),
      expect: () => <DetailMovieState>[
        const DetailMovieState(creditState: CreditLoading()),
        const DetailMovieState(creditState: CreditLoaded(credit: list)),
      ],
    );
    blocTest<DetailMovieCubit, DetailMovieState>(
      'should emit credit failed',
      build: () {
        when(mockGetCreditMovieUsecase(params: id)).thenAnswer(
          (_) async => const Left<AppError, List<CreditEntity>>(
              AppError(AppErrorEnum.api)),
        );
        return detailMovieCubit;
      },
      act: (DetailMovieCubit cubit) => cubit.getCreditUseCase(id),
      expect: () => <DetailMovieState>[
        const DetailMovieState(creditState: CreditLoading()),
        const DetailMovieState(
            creditState: CreditFailed(error: AppError(AppErrorEnum.api))),
      ],
    );
  });
}
