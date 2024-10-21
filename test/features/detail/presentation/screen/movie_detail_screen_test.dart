import 'dart:async';
import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_test_utils/image_test/image_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/detail/detail.dart';
import 'package:the_movie_db/features/detail/presentation/widgets/widgets.dart';

import '../../../../helpers/mocks/movie_detail_mock.dart';

class MockDetailMovieCubit extends MockCubit<DetailMovieState>
    implements DetailMovieCubit {}

void main() {
  late MockDetailMovieCubit movieCubit;

  setUpAll(() {
    unawaited(initializeDependencies());
  });

  setUp(() {
    HttpOverrides.global = null;
    movieCubit = MockDetailMovieCubit();
  });

  tearDown(() => movieCubit.close());

  const int id = 123456;

  final ScreenUtilInit app = ScreenUtilInit(
    designSize: const Size(360, 640),
    child: BlocProvider<DetailMovieCubit>(
      create: (_) => movieCubit,
      child: const MaterialApp(
        home: Scaffold(
          body: MovieDetailScreen(
            id: id,
          ),
        ),
      ),
    ),
  );

  testWidgets('render error loading state', (WidgetTester tester) async {
    when(() => movieCubit.state).thenReturn(
      const DetailMovieState(
        detailState: DetailLoading(),
      ),
    );
    await tester.pumpWidget(app);
    final Finder loading = find.byType(CircularProgressIndicator);

    expect(loading, findsOneWidget);
  });
  testWidgets('render error failed state', (WidgetTester tester) async {
    when(() => movieCubit.state).thenReturn(
      const DetailMovieState(
        detailState: DetailFailed(error: AppError(AppErrorEnum.api)),
      ),
    );
    await tester.pumpWidget(app);
    final Finder error = find.text(AppErrorEnum.api.message);

    expect(error, findsOneWidget);
  });
  testWidgets('render error loaded state', (WidgetTester tester) async {
    when(() => movieCubit.state).thenReturn(
      const DetailMovieState(
        detailState: DetailLoaded(movie: movieDetail),
      ),
    );

    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(app);
    });

    final Finder text = find.text(movieDetail.overview);
    final Finder moviePoster = find.byType(MoviePoster);

    expect(text, findsOneWidget);
    expect(moviePoster, findsOneWidget);
  });
}
