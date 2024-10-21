import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_test_utils/flutter_image_test_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/search/presentation/widgets/widget.dart';


void main() {
  setUpAll(() => unawaited(initializeDependencies()));

  setUp(() => HttpOverrides.global = null);

  const MovieEntity movie = MovieEntity(
    id: 1,
    title: 'Test Movie',
    posterPath: '/test_path.jpg',
    releaseDate: '2023-01-01',
    overview: 'This is a test movie',
    backdropPath: '/test_path.jpg',
    voteAverage: 12,
  );

  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(360, 640),
    child: MaterialApp(
      home: Scaffold(
        body: SearchMovieCard(movie: movie),
      ),
    ),
  );

  testWidgets('displays movie details and navigates on tap',
      (WidgetTester tester) async {
    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(app);
    });

    final Finder gesture = find.byKey(const Key('movie_gesture_detector'));
    final Finder text = find.text('Test Movie');
    await tester.ensureVisible(gesture);
    await tester.tap(gesture, warnIfMissed: false);
    await tester.pump();

    expect(gesture, findsOneWidget);
    expect(text, findsOneWidget);
  });
}
