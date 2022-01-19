import 'package:flutter_application_1/core/init/network/i_core_dio.dart';
import 'package:flutter_application_1/core/init/network/network_manager.dart';
import 'package:flutter_test/flutter_test.dart';

main(List<String> args) {
  // ignore: unused_local_variable
  ICoreDio coreDio;
  setUp(() {
    coreDio = NetworkManager.instance!.coreDio!;
  });
  test('Sample', () {});
}
