import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_movie_db/features/home/home.dart';

import '../../../features/search/search.dart';
import '../../core.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          builder: (_, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'TheMovieDB',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: BlocProvider<SearchCubit>.value(
                value: locator<SearchCubit>(),
                child: const HomeScreen(),
              ),
            );
          }),
    );
  }
}
