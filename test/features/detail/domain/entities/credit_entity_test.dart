import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/features/detail/detail.dart';

void main() {
  const CreditEntity params1 = CreditEntity(
    name: 'name',
    profilePath: 'profilePath',
    character: 'character',
  );
  const CreditEntity params2 = CreditEntity(
   name: 'name2',
    profilePath: 'profilePath2',
    character: 'character2',
  );

  test('Validate Entity testing', () {
    expect(params1.name, 'name');
    expect(params1.profilePath, 'profilePath');
    expect(params1.character, 'character');
  });
  test('Validate if equals entity params1 and params2', () {
    expect(params1 == params2, isFalse);
  });
}