import 'package:flutter/material.dart';

import '../../extensions/string_extension.dart';

class LocaleText extends StatelessWidget {
  final String textValue;
  const LocaleText({ Key? key, required this.textValue }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(textValue.locale);
  }
}