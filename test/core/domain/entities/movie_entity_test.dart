import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/core/core.dart';

void main() {
  const MovieEntity params1 = MovieEntity(
    posterPath: 'posterPath',
    id: 0,
    backdropPath: 'backdropPath',
    title: 'title',
    voteAverage: 12,
    releaseDate: 'releaseDate',
  );
  const MovieEntity params2 = MovieEntity(
    posterPath: 'posterPath',
    id: 2,
    backdropPath: 'backdropPath',
    title: 'title',
    voteAverage: 12,
    releaseDate: 'releaseDate',
  );

  test('Validate Entity testing', () {
    expect(params1.posterPath, 'posterPath');
    expect(params1.id, 0);
    expect(params1.backdropPath, 'backdropPath');
    expect(params1.title, 'title');
    expect(params1.voteAverage, 12);
    expect(params1.releaseDate, 'releaseDate');
  });
  test('Validate if equals entity params1 and params2', () {
    expect(params1 == params2, isFalse);
  });
}
