import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/features/detail/detail.dart';

void main() {
  const GenreEntity params1 = GenreEntity(
    name: 'name',
  );
  const GenreEntity params2 = GenreEntity(
    name: 'name2',
  );

  test('Validate Entity testing', () {
    expect(params1.name, 'name');
  });
  test('Validate if equals entity params1 and params2', () {
    expect(params1 == params2, isFalse);
  });
}
