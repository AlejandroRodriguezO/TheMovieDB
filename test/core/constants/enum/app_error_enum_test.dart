import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/core/core.dart';

void main() {
  group('AppErrorEnum', () {
    test('should return the correct message for api error', () {
      const AppErrorEnum error = AppErrorEnum.api;
      expect(error.toString(), 'API error occurred');
    });

    test('should return the correct message for network error', () {
      const AppErrorEnum error = AppErrorEnum.network;
      expect(error.toString(), 'Network error, please check your connection');
    });

    test('should return the correct message for not found error', () {
      const AppErrorEnum error = AppErrorEnum.notFound;
      expect(error.toString(), 'Requested resource not found');
    });
  });
}
