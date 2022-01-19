// ignore_for_file: unused_local_variable

import 'package:flutter_application_1/core/base/model/base_error.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  setUp(() {
    print("object");
  });

  test("description", () {
    final isUserLogin = true;
    expect("isUserLogin", isTrue);
  });

  group("Full Test", () {
    // test 1
    test("description", () {
      final isUserLogin = true;
      expect("isUserLogin", isTrue);
    });
    // test 2
    test("description", () {
      final isUserLogin = true;
      expect("isUserLogin", isTrue);
    });
    // test 3
    test("description", () {
      final isUserLogin = true;
      expect("isUserLogin", isTrue);
    });
  });
  test('dynamic parse', () {
    final error = BaseError(message :"aaabbb");
    final errorDynamic = error as dynamic;
    expect(errorDynamic, isNotNull);
  });
}
