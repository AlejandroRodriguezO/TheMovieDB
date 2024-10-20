import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/detail/detail.dart';
import 'package:the_movie_db/features/detail/presentation/widgets/credit_list.dart';

class MockDetailMovieCubit extends MockCubit<DetailMovieState>
    implements DetailMovieCubit {}

void main() {
  late MockDetailMovieCubit movieCubit;

  setUp(() {
    HttpOverrides.global = null;
    movieCubit = MockDetailMovieCubit();
  });

  tearDown(() => movieCubit.close());

  const List<CreditEntity> credits = <CreditEntity>[
    CreditEntity(
      name: 'name',
      profilePath: 'profilePath',
      character: 'character',
    ),
  ];

  final ScreenUtilInit app = ScreenUtilInit(
    designSize: const Size(360, 640),
    child: BlocProvider<DetailMovieCubit>(
      create: (_) => movieCubit,
      child: const MaterialApp(
        home: Scaffold(
          body: CreditList(),
        ),
      ),
    ),
  );

  testWidgets('render error failed state', (WidgetTester tester) async {
    when(() => movieCubit.state).thenReturn(
      const DetailMovieState(
        creditState: CreditFailed(
          error: AppError(AppErrorEnum.api),
        ),
      ),
    );
    await tester.pumpWidget(app);

    final Finder finder = find.text('API error occurred');

    expect(finder, findsOneWidget);
  });

  testWidgets('render loading state', (WidgetTester tester) async {
    when(() => movieCubit.state).thenReturn(
      const DetailMovieState(
        creditState: CreditLoading(),
      ),
    );
    await tester.pumpWidget(app);

    final Finder finder = find.byType(CircularProgressIndicator);

    expect(finder, findsOneWidget);
  });
  testWidgets('render loaded state -> empty list', (WidgetTester tester) async {
    when(() => movieCubit.state).thenReturn(
      const DetailMovieState(
        creditState: CreditLoaded(credit: <CreditEntity>[]),
      ),
    );
    await tester.pumpWidget(app);

    final Finder finder = find.byType(SizedBox);

    expect(finder, findsOneWidget);
  });
  testWidgets('render loaded state -> credit list',
      (WidgetTester tester) async {
    when(() => movieCubit.state).thenReturn(
      const DetailMovieState(
        creditState: CreditLoaded(credit: credits),
      ),
    );
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    final Finder textCredit = find.text('Reparto');
    final Finder list = find.byType(ListView);

    expect(textCredit, findsOneWidget);
    expect(list, findsOneWidget);
  });
}
