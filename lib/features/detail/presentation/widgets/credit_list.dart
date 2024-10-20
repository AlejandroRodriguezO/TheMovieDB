import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:the_movie_db/core/core.dart';
import 'package:the_movie_db/features/detail/domain/entities/credit_entity.dart';

import '../cubit/detail_movie_cubit.dart';

class CreditList extends StatelessWidget {
  const CreditList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailMovieCubit, DetailMovieState>(
      builder: (BuildContext context, DetailMovieState state) {
        return Center(
          child: switch (state.creditState) {
            final CreditLoaded data => data.credit.isEmpty
                ? const SizedBox.shrink()
                : Column(
                    children: <Widget>[
                      Text(
                        'Reparto',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 100.h,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: data.credit.length,
                          itemBuilder: (BuildContext context, int index) {
                            final CreditEntity credit = data.credit[index];
                            return SizedBox(
                              height: 100.h,
                              width: 160.w,
                              child: Card(
                                elevation: 1,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(8.w),
                                        ),
                                        child: Image.network(
                                          credit.profilePath.isEmpty
                                              ? kNoImage
                                              : '${ApiUrls.baseUrlImage}${credit.profilePath}',
                                          height: 100.h,
                                          width: 160.w,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                      ),
                                      child: Text(
                                        credit.name,
                                        overflow: TextOverflow.fade,
                                        maxLines: 1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 8.w,
                                        right: 8.w,
                                        bottom: 2.h,
                                      ),
                                      child: Text(
                                        credit.character,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
            final CreditFailed failed =>
              Text(failed.error.appErrorType.message),
            _ => const CircularProgressIndicator.adaptive()
          },
        );
      },
    );
  }
}
