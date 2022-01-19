import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/components/list-view/indicator_list_view.dart';



class OnBoardIndicator extends StatelessWidget {
  final int? itemCount;
  final int? currentIndex;
  const OnBoardIndicator({Key? key, this.itemCount, this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return IndicatorListView(
        itemCount: itemCount,
        onListItem: (index) {
          return FlutterLogo();
        },
      );
    });
  }
}
