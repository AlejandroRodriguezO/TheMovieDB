import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../../detail/detail.dart';

class SearchMovieCard extends StatelessWidget {
  const SearchMovieCard({super.key, required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<MovieDetailScreen>(
          builder: (BuildContext context) => BlocProvider<DetailMovieCubit>(
            create: (_) => locator<DetailMovieCubit>()
              ..getMovieUseCase(movie.id)
              ..getCreditUseCase(movie.id),
            child: MovieDetailScreen(
              id: movie.id,
            ),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 2.h,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.network(
                      movie.posterPath.isEmpty
                          ? kNoImage
                          : '${ApiUrls.baseUrlImage}${movie.posterPath}',
                      fit: BoxFit.cover,
                      height: 100.h,
                      width: 80.w,
                    ),
                  ),
                  if (movie.releaseDate != null &&
                      movie.releaseDate!.isNotEmpty)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.gray100,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: Text(
                            movie.releaseDate ?? '',
                            style: TextStyle(
                              fontSize: 11.sp,
                              color: AppColors.gray500,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      movie.title,
                      style: TextStyle(
                        color: AppColors.gray500,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      movie.overview ?? '',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.gray400,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
