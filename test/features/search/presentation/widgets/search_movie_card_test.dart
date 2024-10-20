import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/search/presentation/widgets/widget.dart';


class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  setUp(() => HttpOverrides.global = null);

  testWidgets('displays movie details and navigates on tap',
      (WidgetTester tester) async {
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();
    const MovieEntity movie = MovieEntity(
      id: 1,
      title: 'Test Movie',
      posterPath: '/test_path.jpg',
      releaseDate: '2023-01-01',
      overview: 'This is a test movie',
      backdropPath: '/test_path.jpg',
      voteAverage: 12,
    );

    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 640),
        child: MaterialApp(
          navigatorObservers: <NavigatorObserver>[mockObserver],
          home: const Scaffold(
            body: SearchMovieCard(movie: movie),
          ),
        ),
      ),
    );

    expect(find.text('Test Movie'), findsOneWidget);

    await tester.tap(find.byType(GestureDetector));
    await tester.pumpAndSettle();
  });
}
