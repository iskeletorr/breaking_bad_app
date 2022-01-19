
import 'package:flutter_application_1/core/init/network/i_response_model.dart';

import '../../base/model/base_model.dart';
import '../../constants/enum/network_type_enum.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetchType<R, T extends BaseModel>(String path,
      {required NetworkTypes type,
      required T parseModel,
      data,
      Map<String, dynamic>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) ;
}