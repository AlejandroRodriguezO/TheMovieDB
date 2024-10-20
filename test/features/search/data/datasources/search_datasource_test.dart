import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/core/data/models/movie_model.dart';
import 'package:the_movie_db/features/search/search.dart';

import '../../../../helpers/helper.mocks.dart';

void main() {
  late MockDio mockDio;
  late SearchDatasource searchDatasource;

  setUp(() {
    mockDio = MockDio();
    searchDatasource = SearchDatasourceImpl(
      client: mockDio,
    );
  });

  const String query = 'batman';
  test('should movie return 200', () async {
    // Arrange

    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer(
      (_) async => Response<dynamic>(
        data: <String, dynamic>{
          'results': <Map<String, Object>>[
            <String, Object>{
              'adult': false,
              'backdrop_path': '/2va32apQP97gvUxaMnL5wYt4CRB.jpg',
              'genre_ids': <int>[14, 28, 80],
              'id': 268,
              'original_language': 'en',
              'original_title': 'Batman',
              'overview':
                  "Batman must face his most ruthless nemesis when a deformed madman calling himself \"The Joker\" seizes control of Gotham's criminal underworld.",
              'popularity': 66.59,
              'poster_path': '/cij4dd21v2Rk2YtUQbV5kW69WB2.jpg',
              'release_date': '1989-06-21',
              'title': 'Batman',
              'video': false,
              'vote_average': 7.2,
              'vote_count': 7755
            },
          ],
        },
        requestOptions: RequestOptions(),
        statusCode: 200,
      ),
    );

    final List<MovieModel> result =
        await searchDatasource.getMoviesSearched(query);

    //assert
    expect(result, isA<List<MovieModel>>());
  });
}
