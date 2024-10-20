import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/core/core.dart';

void main() {
  const AppError params1 = AppError(
    AppErrorEnum.api
  );
  const AppError params2 = AppError(
     AppErrorEnum.network
  );

  test('Validate Entity testing', () {
    expect(params1.appErrorType, AppErrorEnum.api);
  });
  test('Validate if equals entity params1 and params2', () {
    expect(params1 == params2, isFalse);
  });
}
