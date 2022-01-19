import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

import '../../base/model/base_error.dart';
import '../../base/model/base_model.dart';
import '../../constants/enum/network_type_enum.dart';
import '../../extensions/network_type_extension.dart';
import 'i_core_dio.dart';
import 'i_response_model.dart';
part 'network_core/core_operations.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  // ...
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());
    this.httpClientAdapter = DefaultHttpClientAdapter();
  }

  Future<IResponseModel<R>> fetchType<R, T extends BaseModel>(String path,
      {required NetworkTypes type,
      required T parseModel,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
    final response = await request(path, data: data, options: Options(method: type.methodType));
    switch (response.statusCode) {
      case HttpStatus.ok:
        final model = _responseParser<R,T>(response, parseModel);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel<R>(error: BaseError(message: "Error"));
    }
  } 
}
