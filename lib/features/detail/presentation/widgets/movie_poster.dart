import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, required this.movie});

  final DetailEntity movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Theme.of(context).primaryColor.withOpacity(0.3),
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: Image.network(
            movie.posterPath.isEmpty
                ? kNoImage
                : '${ApiUrls.baseUrlImage}${movie.posterPath}',
            width: double.infinity,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.releaseDate,
              style: TextStyle(
                color: AppColors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            subtitle: Wrap(
              spacing: 5.w,
              children: movie.genres
                  .map((GenreEntity item) => Text(
                        item.name,
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ))
                  .toList(),
            ),
            trailing: FittedBox(
              child: Row(
                children: <Widget>[
                  const Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 4.w),
                  Text(
                    (movie.voteAverage / 2).toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 16.w,
          right: 16.w,
          top: kToolbarHeight + 4.h,
          child: Row(
            children: <Widget>[
              const BackButton(
                color: AppColors.white,
              ),
              SizedBox(width: 8.w),
              Flexible(
                child: Text(
                  movie.title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
