import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/view/auth/onboard/view/on_board_view.dart';

import '../../../view/auth/test/view/test_view.dart';
import '../../components/text/not_found_text.dart';
import 'navigation_constants.dart';

class NavigationRoute{
  static NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;
  
  NavigationRoute._init();

  Route<dynamic> generateRoute (RouteSettings args){
    switch(args.name){
      case NavigationConstants.TEST_VIEW:
          return normalNavigate(TestView());
      
      case NavigationConstants.ON_BOARD:
        return normalNavigate(OnBoardView());
      default:
        return MaterialPageRoute(builder: (context)=>NotFoundNavigation());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget){
    return MaterialPageRoute(builder: (context)=> widget);
  }
}