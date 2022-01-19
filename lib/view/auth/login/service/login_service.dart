import 'package:flutter_application_1/view/_products/enum/network_route_enum.dart';
import 'package:vexana/vexana.dart';

import '../model/login_response_model.dart';
import '../model/login_model.dart';
import 'i_login_service.dart';
import 'package:vexana/src/interface/INetworkService.dart';

class LoginService extends ILoginService{
  LoginService(INetworkManager manager) : super(manager);

  @override
  Future<LoginResponseModel?> fetchUserControl(LoginModel model) async {
    final response = await manager.send<LoginModel,LoginResponseModel>(NetworkRoutes.LOGIN.routeValue, parseModel: LoginModel(), method: RequestType.POST,data: model);
    if(response.data is LoginResponseModel)
      return response.data;
    else return null;
  }
}