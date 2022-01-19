import 'package:flutter/material.dart';

import '../../extensions/context_extension.dart';

class IndicatorListView extends StatelessWidget {
  final int? itemCount;
  final int? currentIndex;
  final Widget Function(int index)? onListItem;
  const IndicatorListView({Key? key, this.itemCount, this.onListItem, this.currentIndex}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return viewPadding(context, index);
      },
    );
  }
  
  Padding viewPadding(BuildContext context, int index) =>
      Padding(padding: context.allLowH, child: viewCircleAvatar(index, context));

  CircleAvatar viewCircleAvatar(int index, BuildContext context) {
    return CircleAvatar(
      radius: getCurrentIndex(index) ? context.width * 0.01 : context.width * 0.005,
      child: AnimatedOpacity(
        opacity: opacityValue(index),
        duration: context.normalDuration,
        child: onListItem!(index),
      ),
    );
  }

  double opacityValue(int index) => getCurrentIndex(index) ? 1 : 0;

  bool getCurrentIndex(int index) => currentIndex == index;

}