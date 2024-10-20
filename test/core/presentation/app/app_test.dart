import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/core/core.dart';

void main() {
  setUpAll(() => unawaited(initializeDependencies()));

  const ScreenUtilInit app = ScreenUtilInit(
    designSize: Size(360, 640),
    child: MyApp(),
  );

  testWidgets('test myApp', (WidgetTester tester) async {
    await tester.pumpWidget(app);

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
