import 'package:flutter/cupertino.dart';

class FormColumn extends StatelessWidget {
  final List<Widget>? children;
  const FormColumn({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Spacer(),
        Expanded(
            flex: 8,
            child: Column(
              children: [this.children as Widget], // List<Widget> dönüşmeme hatası olabilir.
            )),
        Spacer(),
      ],
    );
  }
}
