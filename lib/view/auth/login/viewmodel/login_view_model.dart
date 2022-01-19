import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/base/model/base_view_model.dart';
import 'package:flutter_application_1/core/constants/enum/locale_keys_enum.dart';
import 'package:flutter_application_1/core/init/network/vexana_manager.dart';
import 'package:flutter_application_1/view/auth/login/model/login_model.dart';
import 'package:flutter_application_1/view/auth/login/service/i_login_service.dart';
import 'package:flutter_application_1/view/auth/login/service/login_service.dart';

import 'package:mobx/mobx.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store,BaseViewModel {
  ILoginService? loginService;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  void setContext(BuildContext context) => this.context = context;
  void init() {
    loginService = LoginService(VexanaManager.instance.networkManager);
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }
  @observable
  bool isLoading = false;

  @observable
  bool isLockOpen = true;

  @action
  Future<void> fetchLoginService() async {
    isLoadingStateChange();
    if(formKey.currentState!.validate()){
      final response = await loginService!.fetchUserControl(LoginModel(email: emailController!.text,password: passwordController!.text));
      if(response != null){
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(response.token!),));
      }
      await localeManager.setStringValue(PreferencesKeys.TOKEN,response!.token!);
    }
    isLoadingStateChange();
  }

  @action 
  void isLoadingStateChange(){
    isLoading = !isLoading;
  }
  
  @action 
  void isLockStateChange(){
    isLockOpen = !isLockOpen;
  }
}