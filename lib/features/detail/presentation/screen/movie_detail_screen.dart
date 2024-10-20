import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../cubit/detail_movie_cubit.dart';
import '../widgets/credit_list.dart';
import '../widgets/widgets.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: BlocBuilder<DetailMovieCubit, DetailMovieState>(
          builder: (BuildContext context, DetailMovieState state) {
            return Center(
              child: SingleChildScrollView(
                child: switch (state.detailState) {
                  final DetailLoaded data => Column(
                      children: <Widget>[
                        MoviePoster(movie: data.movie),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 10.h),
                          child: Text(
                            data.movie.overview,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray500,
                            ),
                          ),
                        ),
                        const CreditList(),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  final DetailFailed failed => Text(
                      failed.error.appErrorType.message,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: AppColors.gray400,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  _ => const CircularProgressIndicator.adaptive()
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
