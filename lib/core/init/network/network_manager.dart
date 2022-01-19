import 'package:dio/dio.dart';
import '../../constants/enum/locale_keys_enum.dart';
import '../cache/locale_manager.dart';
import 'core_dio.dart';
import 'i_core_dio.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager? get instance {
    if (_instance == null) {_instance = NetworkManager._init();}
    return _instance;
  }

  ICoreDio? coreDio;

  NetworkManager._init() {
    final baseOptions = BaseOptions(
        baseUrl: "https://jsonplaceholder.typicode.com",
        headers: {"val": LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)});
    // _dio = Dio(baseOptions);

    coreDio = CoreDio(baseOptions);

    // _dio!.interceptors.add(InterceptorsWrapper(
    //     onError: (e, h) =>
    //         BaseError(message:e.message), // normalde bunlar onError: (e) => return BaseError(e.message);
    //     onRequest: (options, h) =>
    //         options.path += "aaa", // onRequest: (options) => options.path += "aaa";
    //     onResponse: (e, h) => e.data)); // onResponse: (e) => return e.data;
  }

  // Dio? _dio;

  // Future dioGet<T extends BaseModel>(String path, T model) async {
  //   final response = await _dio!.get(path);

  //   switch (response.statusCode) {
  //     case HttpStatus.ok:
  //       final responseBody = response.data;
  //       if (responseBody is List) {
  //         return responseBody.map((e) => model.fromJson(e).toList());
  //       } else if (responseBody is Map) {
  //         return model.fromJson(
  //             responseBody as Map<String, dynamic>); // olmazsa responseBody.cast(); denenebilir.
  //       }
  //       return responseBody;
  //     default:
  //   }
  // }
}
