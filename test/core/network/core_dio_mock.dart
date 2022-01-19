part of 'core_dio_test.dart';
class _CoreDioMock with DioMixin implements Dio, ICoreDio  {
   final BaseOptions options;

  _CoreDioMock(this.options) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());
    this.httpClientAdapter = DefaultHttpClientAdapter();
  }
  @override
  Future<IResponseModel<R>> fetchType<R, T extends BaseModel>(String path,
      {required NetworkTypes type,
      required T parseModel,
      data,
      Map<String, dynamic>? queryParameters, // normalde Map<String, Object> 
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

R _responseParser<R,T>(dynamic response, BaseModel parseModel) {
    final responseBody = response.data;
    if (responseBody is List) {
      return responseBody.map((e) => parseModel.fromJson(e)).toList().cast<T>() as R;
    } else if (responseBody is Map) {
      return parseModel.fromJson(responseBody as Map<String, dynamic>)
          as R; // olmazsa responseBody.cast(); denenebilir. --- bu satırda sıkıntı çıkabilir direkt responseBody as R yazıyor.
    }
    return responseBody as R;
  }