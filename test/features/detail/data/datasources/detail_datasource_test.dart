import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:the_movie_db/features/detail/detail.dart';

import '../../../../helpers/helper.mocks.dart';

void main() {
  late MockDio mockDio;
  late DetailDatasource detailDatasource;

  setUp(() {
    mockDio = MockDio();
    detailDatasource = DetailDatasourceImpl(
      client: mockDio,
    );
  });

  const int id = 123456;
  test('should detail return 200', () async {
    // Arrange

    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer(
      (_) async => Response<dynamic>(
        data: <String, dynamic>{
          'genres': <Map<String, Object>>[
            <String, Object>{'id': 28, 'name': 'Acción'},
            <String, Object>{'id': 16, 'name': 'Animación'},
            <String, Object>{'id': 80, 'name': 'Crimen'},
            <String, Object>{'id': 9648, 'name': 'Misterio'}
          ],
          'overview':
              'Un nuevo villano de quien sólo se conoce el nombre, "Hush", emplea a todos los enemigos de Gotham para destruir la vida tanto de Batman, el héroe, como la de Bruce Wayne, el empresario y playboy que ahora mantiene una relación íntima con Selina Kyle, también conocida como "Catwoman". Adaptación de uno de los grandes clásicos del universo DC: "Batman: Hush" escrito por Jeph Loeb y dibujado por Jim Lee.',
          'poster_path': '/eiVQORVyVuNNZHPAELuWtlXoQsD.jpg',
          'release_date': '2019-07-19',
          'title': 'Batman: Hush',
        },
        requestOptions: RequestOptions(),
        statusCode: 200,
      ),
    );

    final DetailModel result = await detailDatasource.getDetailMovie(id);

    //assert
    expect(result, isA<DetailModel>());
  });
  test('should detail return 200', () async {
    // Arrange

    when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
        .thenAnswer(
      (_) async => Response<dynamic>(
        data: <String, List<Map<String, String>>>{
          'cast': <Map<String, String>>[
            <String, String>{
              'name': "Jason O'Mara",
              'profile_path': '/hYylPvwMALoQU09r7tvCU24thh0.jpg',
              'character': 'Batman / Bruce Wayne (voice)',
            }
          ]
        },
        requestOptions: RequestOptions(),
        statusCode: 200,
      ),
    );

    final List<CreditModel> result = await detailDatasource.getCreditMovie(id);

    //assert
    expect(result, isA<List<CreditModel>>());
  });
}
