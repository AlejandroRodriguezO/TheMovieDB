import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/features/detail/detail.dart';

import '../../../../helpers/mocks/movie_detail_mock.dart';

void main() {
  const DetailEntity params1 = movieDetail;
  const DetailEntity params2 = DetailEntity(
    title: 'title2',
    posterPath: 'posterPath2',
    overview: 'overview2',
    releaseDate: 'releaseDate2',
    genres: <GenreEntity>[
      GenreEntity(name: 'genre12'),
      GenreEntity(name: 'genre22'),
    ],
    voteAverage: 7.3,
  );

  test('Validate Entity testing', () {
    expect(params1.title, 'title');
    expect(params1.posterPath, 'posterPath');
    expect(params1.overview, 'overview');
    expect(params1.releaseDate, 'releaseDate');
    expect(params1.genres, <GenreEntity>[
      const GenreEntity(name: 'name'),
    ]);
    expect(params1.voteAverage, 7.3);
  });
  test('Validate if equals entity params1 and params2', () {
    expect(params1 == params2, isFalse);
  });
}
