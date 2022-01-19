 import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';

extension StringLocalization on String{

   String get locale => this.tr();

   String get isValid => this.contains(RegExp(ApplicationConstants.EMAIL_REGEX)) ? "valid" : "not valid";
 }


 extension SvgString on String {
   String get svgString => "asset/svg/$this.svg";
 }