import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db/core/core.dart';

void main() {
  group('Debouncer', () {
    test('executes the action after the specified delay', () async {
      final Debouncer debouncer = Debouncer(milliseconds: 100);
      bool actionExecuted = false;

      debouncer.run(() {
        actionExecuted = true;
      });

      expect(actionExecuted, false);

      await Future<dynamic>.delayed(const Duration(milliseconds: 150));
      expect(actionExecuted, true);
    });

    test('cancels the action if run is called again within the delay',
        () async {
      final Debouncer debouncer = Debouncer(milliseconds: 100);
      bool actionExecuted = false;

      debouncer.run(() {
        actionExecuted = true;
      });

      await Future<dynamic>.delayed(const Duration(milliseconds: 50));
      debouncer.run(() {
        actionExecuted = true;
      });

      await Future<dynamic>.delayed(const Duration(milliseconds: 150));
      expect(actionExecuted, true);
    });

    test('cancels the action when cancel is called', () async {
      final Debouncer debouncer = Debouncer(milliseconds: 100);
      bool actionExecuted = false;

      debouncer.run(() {
        actionExecuted = true;
      });

      debouncer.cancel();

      await Future<dynamic>.delayed(const Duration(milliseconds: 150));
      expect(actionExecuted, false);
    });
  });
}
