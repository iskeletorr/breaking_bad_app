
part of '../core_dio.dart';

extension _CoreDioOperation on CoreDio {
R? _responseParser<R,T>(dynamic response, BaseModel parseModel) {
    final responseBody = response.data;
    if (responseBody is List) {
      return responseBody.map((e) => parseModel.fromJson(e)).toList().cast<T>() as R;
    } else if (responseBody is Map) {
      return parseModel.fromJson(responseBody as Map<String, Object>)
          as R; // olmazsa responseBody.cast(); denenebilir. --- bu satırda sıkıntı çıkabilir direkt responseBody as R yazıyor.
    }
    return responseBody as R?;
  }
}