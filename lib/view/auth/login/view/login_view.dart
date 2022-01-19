import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/app/app_constants.dart';
import 'package:flutter_application_1/core/init/lang/locale_keys.g.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/extensions/context_extension.dart';
import '../viewmodel/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        viewModel: LoginViewModel(),
        onDispose: () {},
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuild: (BuildContext context, LoginViewModel value) => DefaultTabController(
              length: 2,
              child: Scaffold(
                key: value.scaffoldKey,
                body: SafeArea(
                  child: Column(
                    children: [
                      animatedContainer(context),
                      tabBarContainer(context),
                      Expanded(flex: 6, child: Padding(padding: context.allLowH, child: mainForm(value, context))),
                    ],
                  ),
                ),
              ),
            ));
  }

  AnimatedContainer animatedContainer(BuildContext context) {
    return AnimatedContainer(
        height: context.mediaQuery.viewInsets.bottom > 0 ? 0 : context.height * 0.3,
        color: Colors.white,
        duration: context.lowDuration,
        child: Center(child: FlutterLogo()));
  }

  Container tabBarContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Padding(
        padding: EdgeInsets.only(left: context.width*0.1, right: context.width*0.1, bottom: context.width*0.01),
        child: pageTabBar(context),
      ),
    );
  }

  TabBar pageTabBar(BuildContext context) {
    return TabBar(
        labelStyle: context.textTheme.headline5,
        unselectedLabelStyle: context.textTheme.headline5,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: context.colors.onError,
        indicatorWeight: 4,
        labelColor: Colors.black,
        tabs: [
          Tab(
            text: "   ${LocaleKeys.login_tab1.tr() }   ",
          ),
          Tab(
            text: "    ${LocaleKeys.login_tab2.tr()}    ",
          )
        ]);
  }

  Form mainForm(LoginViewModel value, BuildContext context) {
    return Form(
      key: value.formKey,
      child: Column(
        children: [
          Spacer(flex: 6),
          emailFormField(context, value),
          passwordFormField(context, value),
          Spacer(),
          forgotButton(),
          Spacer(flex: 6),
          loginButton(context, value),
          rowSignup(),
          Spacer(),
        ],
      ),
    );
  }

  Widget passwordFormField(BuildContext context, LoginViewModel value) => Observer(builder: (_) {
        return TextFormField(
          validator: (value) => value!.isNotEmpty ? null : "Required",
          controller: value.passwordController,
          decoration: InputDecoration(
              suffixIcon: IconButton(onPressed: () => value.isLockStateChange(), icon: Icon(Icons.remove_red_eye)),
              labelText: LocaleKeys.login_password ,
              labelStyle: context.textTheme.subtitle1,
              icon: iconFieldContainer(context, Icons.password)),
          obscureText: value.isLockOpen,
        );
      });

  TextFormField emailFormField(BuildContext context, LoginViewModel value) => TextFormField(
        validator: (value) => value!.contains(RegExp(ApplicationConstants.EMAIL_REGEX)) ? null : "Not Valid Email",
        controller: value.emailController,
        decoration: InputDecoration(
            labelText: LocaleKeys.login_email, labelStyle: context.textTheme.subtitle1, icon: iconFieldContainer(context, Icons.email_outlined)),
      );

  Container iconFieldContainer(BuildContext context, IconData icon) {
    return Container(
        padding: context.allLowH,
        color: context.colors.onError,
        child: Icon(
          icon,
          color: context.colors.primaryVariant,
        ));
  }

  Row forgotButton() => Row(
        // Burası normalde içinde text olan Align döndürüyor, buton ve rowu ben ekledim.
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: Text("${LocaleKeys.login_forgotPassword }"),
          ),
        ],
      );

  ElevatedButton loginButton(BuildContext context, LoginViewModel value) {
    return ElevatedButton(
        onPressed: () {
          value.fetchLoginService();
        },
        style: ElevatedButton.styleFrom(
            primary: context.colors.onError,
            padding: context.symmetricNormal,
            textStyle: context.textTheme.headline5,
            // TextThemeLight.instance!.headline5, böyle de yapılabilir.
            shape: StadiumBorder()),
        child: Center(child: Text("${LocaleKeys.login_loginButton }", style: TextStyle(color: context.colors.onSecondary))));
  }

  Row rowSignup() {
    return Row(
      // Burada Wrap kullandı ama videodaki gibi olmadığından Row kullandım.
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("${LocaleKeys.login_newAccount}"), TextButton(onPressed: () {}, child: Center(child: Text("${LocaleKeys.login_tab2}")))],
    );
  }
}
