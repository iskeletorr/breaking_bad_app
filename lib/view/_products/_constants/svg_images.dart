import 'package:flutter_application_1/core/extensions/string_extension.dart';

class SvgImages {
static SvgImages? _instance;
static SvgImages get instance {
if(_instance == null) {_instance = SvgImages._init();}
return _instance!;
}
 SvgImages._init();

 final departingSVG = "departing".svgString;
 final developerSVG = "developer_activity".svgString;
 final walkSVG = "walk_in_the_city".svgString;

 
}
