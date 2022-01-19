import 'dart:math';

import 'package:flutter/material.dart';


extension ContextExtension on BuildContext{
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width; 
  // yukarıdaki ile aşağıdaki aynı, alttaki parametreli hali
  double dynamicWidth (double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight (double val) => MediaQuery.of(this).size.height * val;

}
extension PaddingExtension on BuildContext{
  EdgeInsets get allLowH => EdgeInsets.all(lowValueH);
  EdgeInsets get symmetricLowH => EdgeInsets.symmetric(horizontal: lowValueH);
  EdgeInsets get symmetricNormal => EdgeInsets.symmetric(horizontal: 50,vertical:20);
  
}

extension ThemeExtension on BuildContext{
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension NumberExtension on BuildContext{
  double get lowValueH => dynamicHeight(0.01);
  double get lowValueW => dynamicWidth(0.01);
  double get mediumValueH => dynamicHeight(0.03);
}

extension EmptyWidget on BuildContext{
  Widget get emptyWidgetHeight => SizedBox(height: lowValueH,);
  Widget get emptyWidgetWidth => SizedBox(width: lowValueW,);
}

extension ColorExtension on BuildContext{
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DurationExtension on BuildContext{
  Duration get lowDuration => Duration(milliseconds: 500);
  Duration get normalDuration => Duration(seconds: 1);
}

extension RandomContainerExtension on BuildContext{
  Container get randomColorContainer => Container(color : Colors.primaries[Random().nextInt(17)]);
}