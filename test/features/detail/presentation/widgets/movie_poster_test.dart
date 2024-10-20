import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/features/detail/presentation/widgets/widgets.dart';

import '../../../../helpers/mocks/movie_detail_mock.dart';


void main() {

  setUp(() => HttpOverrides.global = null);

  

  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(360, 640),
    child: MaterialApp(
      home: Scaffold(
        body: MoviePoster(movie: movieDetail),
      ),
    ),
  );

  testWidgets('render Movie poster test', (WidgetTester tester) async {
    await tester.pumpWidget(app);

    await tester.pumpAndSettle();
    final Finder finder = find.text(movieDetail.releaseDate);

    expect(finder, findsOne);
  });
}
