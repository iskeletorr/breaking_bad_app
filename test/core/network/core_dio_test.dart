import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/base/model/base_error.dart';
import 'package:flutter_application_1/core/constants/enum/network_type_enum.dart';
import 'package:flutter_application_1/core/base/model/base_model.dart';
import 'package:flutter_application_1/core/extensions/network_type_extension.dart';
import 'package:flutter_application_1/core/init/network/i_core_dio.dart';
import 'package:flutter_application_1/core/init/network/i_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dio_mock_model.dart';
part 'core_dio_mock.dart';
main() {
  ICoreDio? service;
  setUp(() {
    service = _CoreDioMock(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com"));
  });
  test('CoreDioTest', () async {
    final response = await service!.fetchType<List<PostModel>,PostModel>("/posts", type: NetworkTypes.GET, parseModel: PostModel());
    expect(response.data, isList );
  });
}




