import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:the_movie_db/features/features.dart';

@GenerateMocks(
  <Type>[
    DetailDatasource,
    DetailRepository,
    GetDetailMovieUsecase,
    GetCreditMovieUsecase,
    SearchDatasource,
    SearchRepository,
    GetMovieSearchedUsecase,
  ],
  customMocks: <MockSpec<Dio>>[MockSpec<Dio>(as: #MockDio)],
)
void main() {}
