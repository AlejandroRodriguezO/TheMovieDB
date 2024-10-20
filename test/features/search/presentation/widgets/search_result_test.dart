import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db/core/core.dart';

import 'package:the_movie_db/features/search/presentation/widgets/search_result.dart';
import 'package:the_movie_db/features/search/search.dart';

class MockSearchCubit extends MockCubit<SearchState> implements SearchCubit {}

void main() {
  late MockSearchCubit mockSearchCubit;

  setUp(() {
    HttpOverrides.global = null;
    mockSearchCubit = MockSearchCubit();
  });

  Widget buildWidgetUnderTest() {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      child: MaterialApp(
        home: BlocProvider<SearchCubit>(
          create: (_) => mockSearchCubit,
          child: Scaffold(
            body: SearchResult(
              searchCubit: mockSearchCubit,
            ),
          ),
        ),
      ),
    );
  }

  testWidgets(
      'Displays “Escribe para realizar la busqueda” when the status is SearchMovieInitial',
      (WidgetTester tester) async {
    when(() => mockSearchCubit.state).thenReturn(const SearchMovieInitial());

    await tester.pumpWidget(buildWidgetUnderTest());

    expect(find.text('Escribe para realizar la busqueda'), findsOneWidget);
  });

  testWidgets(
      'Displays “Pelicula no encontrada” when the status is SearchMovieLoaded and the list is empty.',
      (WidgetTester tester) async {
    when(() => mockSearchCubit.state)
        .thenReturn(const SearchMovieLoaded(movies: <MovieEntity>[]));

    await tester.pumpWidget(buildWidgetUnderTest());

    expect(find.text('Pelicula no encontrada'), findsOneWidget);
  });

  tearDown(() => mockSearchCubit.close());

  testWidgets(
      'Displays a ListView when the status is SearchMovieLoaded and there are movies.',
      (WidgetTester tester) async {
    final List<MovieEntity> movies = <MovieEntity>[
      const MovieEntity(
        posterPath: '',
        id: 0,
        backdropPath: 'backdropPath',
        title: 'title',
        voteAverage: 12,
        releaseDate: 'releaseDate',
      ),
    ];
    when(() => mockSearchCubit.state)
        .thenReturn(SearchMovieLoaded(movies: movies));

    await tester.pumpWidget(buildWidgetUnderTest());
    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);
    expect(find.text('title'), findsOneWidget);
  });

  testWidgets(
      'Displays a CircularProgressIndicator when the status is SearchMovieLoading',
      (WidgetTester tester) async {
    when(() => mockSearchCubit.state).thenReturn(const SearchMovieLoading());

    await tester.pumpWidget(buildWidgetUnderTest());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Display error when status is SearchMovieFailed',
      (WidgetTester tester) async {
    when(() => mockSearchCubit.state)
        .thenReturn(const SearchMovieFailed(AppError(AppErrorEnum.network)));

    await tester.pumpWidget(buildWidgetUnderTest());

    expect(find.text('Network error, please check your connection'),
        findsOneWidget);
  });
}
