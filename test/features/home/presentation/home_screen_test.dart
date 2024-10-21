import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/core/di/di.dart';
import 'package:the_movie_db/features/home/home.dart';

void main() {
  setUpAll(() => unawaited(initializeDependencies()));

  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(360, 640),
    child: MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
      ),
    ),
  );

  testWidgets('home screen testing', (WidgetTester tester) async {
    await tester.pumpWidget(app);

    final Finder container = find.byType(Container);
    final Finder search = find.byIcon(Icons.search);

    await tester.tap(search);
    await tester.pump();

    expect(container, findsOneWidget);
    expect(search, findsOneWidget);
  });
}
