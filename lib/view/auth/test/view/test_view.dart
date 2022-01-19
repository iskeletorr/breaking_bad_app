// ignore_for_file: unused_element

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/state/base_state.dart';
import '../../../../core/base/view/base_view.dart';
import '../../../../core/constants/enum/locale_keys_enum.dart';
import '../../../../core/extensions/string_extension.dart';
import '../../../../core/init/cache/locale_manager.dart';
import '../../../../core/init/lang/language_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';
import '../viewmodel/test_view_model.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  _TestViewState createState() => _TestViewState();
}

class _TestViewState extends BaseState<TestView> {
  late TestViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
        viewModel: TestViewModel(),
        onDispose: () {},
        onModelReady: (model) {
          viewModel = model;
        },
        onPageBuild: (context, value) => scaffoldBody);
  }

  Widget get scaffoldBody {
    return Scaffold(appBar: appBar(), floatingActionButton: buttonIncrement, body: textNumber);
  }

  AppBar appBar() {
    return AppBar(
        leading: Text(LocaleManager.instance.getStringValue(PreferencesKeys.TOKEN)),
        title: welcomeTextWidget(),
        actions: [iconButtonForLanguage()]);
  }

  Text welcomeTextWidget() => Text(LocaleKeys.welcome.locale);

  IconButton iconButtonForLanguage() => IconButton(
      onPressed: () => context.setLocale(LanguageManager.instance.enLocale),
      icon: Icon(Icons.favorite));

  Widget get textNumber => Observer(builder: (context) => Text(viewModel.value.toString()));

  FloatingActionButton get buttonIncrement =>
      FloatingActionButton(onPressed: () => viewModel.increment());
}

extension _FormField on _TestViewState {
  TextFormField get mailField => TextFormField(
        validator: (value) => value!.isValid,
      );
}
