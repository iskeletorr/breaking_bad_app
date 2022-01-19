// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../../core/base/model/base_view_model.dart';
import '../../../../core/constants/enum/app_theme_enum.dart';
import '../../../../core/constants/enum/network_type_enum.dart';
import '../../../../core/init/notifier/theme_notifier.dart';
import '../model/test_model.dart';

part 'test_view_model.g.dart'; // build_runner_watch diyince otomatik olarak
// test_view_model_g.dart isimli bir dosya oluşturuyor ve artık burada yaptıklarımız
// otomatik olarak o dosyaya ekleniyor

class TestViewModel = _TestViewModelBase with _$TestViewModel;

abstract class _TestViewModelBase with Store, BaseViewModel {
  void setContext(BuildContext context) => this.context = context;
  void init() {}

  @observable
  bool isLoading = false;
  @observable
  int value = 0;

  @computed
  bool get isEven => value % 2 == 0;

  @action
  void increment() {
    value++;
  }

  void changeTheme() {
    Provider.of<ThemeNotifier>(context!, listen: false).changeTheme(AppThemes.DARK);
  }

  @action
  Future<void> getSampleRequest() async {
    isLoading = true;
    // await NetworkManager.instance!.dioGet<TestModel>("x", TestModel());
    final response = await coreDio!.fetchType<List<TestModel>, TestModel>("path",
        type: NetworkTypes.GET, parseModel: TestModel());
    // if (response.data is List<TestModel>) {
    //   response.data;
    // } else {
    //   response.error;
    // }
    isLoading = false;
  }
}
