import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../cubit/search_cubit.dart';
import 'widget.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({
    super.key,
    required this.searchCubit,
  });

  final SearchCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (BuildContext context, SearchState state) {
        return Center(
          child: switch (state) {
            final SearchMovieLoaded data => data.movies.isEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: const Text(
                      'Pelicula no encontrada',
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        SearchMovieCard(
                      movie: data.movies[index],
                    ),
                    itemCount: data.movies.length,
                    scrollDirection: Axis.vertical,
                  ),
            final SearchMovieFailed error =>
              Text(error.error.appErrorType.message),
            SearchMovieLoading() => const CircularProgressIndicator.adaptive(),
            SearchMovieInitial() => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  'Escribe para realizar la busqueda',
                  style: TextStyle(
                    color: AppColors.gray500,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          },
        );
      },
    );
  }
}
