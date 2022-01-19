import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../_products/_widgets/avatar/avatar.dart';
import '../model/on_board_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base/view/base_view.dart';
import '../view-model/on_board_view_model.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.symmetricLowH,
      child: BaseView<OnBoardViewModel>(
          viewModel: OnBoardViewModel(),
          onModelReady: (model) {
            model.setContext(context);
            model.init();
          },
          onPageBuild: (BuildContext context, OnBoardViewModel viewModel) => Scaffold(
                body: Padding(
                  padding: context.symmetricLowH,
                  child: Column(
                    children: [
                      Spacer(),
                      Expanded(flex: 5, child: pageView(viewModel)),
                      Expanded(flex: 2, child: bodyRow(viewModel, context)),
                    ],
                  ),
                ),
              )),
    );
  }

  PageView pageView(OnBoardViewModel viewModel) {
    return PageView.builder(
        onPageChanged: (value) => viewModel.changeCurrentIndex(value),
        itemCount: viewModel.onBoardItems.length,
        itemBuilder: (context, index) => bodyColumn(context, viewModel.onBoardItems[index]));
  }

  Row bodyRow(OnBoardViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(flex: 2, child: selectedPageCircle(viewModel)),
        Expanded(child: Center(child: Observer(builder: (_) {
          return Visibility(visible: viewModel.isLoading, child: CircularProgressIndicator());
        }))),
        skipButton(context, viewModel)
      ],
    );
  }

  ListView selectedPageCircle(OnBoardViewModel viewModel) {
    return ListView.builder(
      itemCount: viewModel.onBoardItems.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Observer(
          builder: (BuildContext context) {
            return OnBoardCircle(isSelected: viewModel.currentIndex == index);
          },
        );
      },
    );
  }

  FloatingActionButton skipButton(BuildContext context, OnBoardViewModel viewModel) {
    return FloatingActionButton(
        backgroundColor: context.colors.secondaryVariant,
        child: Icon(
          Icons.double_arrow_rounded,
          color: context.colors.primaryVariant,
        ),
        onPressed: () {
          viewModel.completeToOnBoard();
        });
  }

  Column bodyColumn(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Expanded(flex: 5, child: svgPicture(model.imagePath)),
        Expanded(flex: 3, child: descriptionColumn(context, model)),
      ],
    );
  }

  Column descriptionColumn(BuildContext context, OnBoardModel model) {
    return Column(
      children: [
        Padding(
          padding: context.allLowH,
          child: Text(
            model.title,
            textAlign: TextAlign.center,
            style: context.textTheme.headline3!.copyWith(color: context.colors.onSecondary),
          ),
        ),
        Padding(
          padding: context.allLowH,
          child: Text(
            model.description,
            style: context.textTheme.subtitle1,
          ),
        )
      ],
    );
  }

  SvgPicture svgPicture(String path) => SvgPicture.asset(path);
}








































// import 'package:flutter/material.dart';

// import '../../../../core/base/view/base_view.dart';
// import '../../../../core/components/column/form_column.dart';
// import '../../../../core/components/list-view/indicator_list_view.dart';
// import '../../../../core/extensions/context_extension.dart';
// import '../view-model/on_board_view_model.dart';

// class OnBoardView extends StatefulWidget {
//   const OnBoardView({Key? key}) : super(key: key);

//   @override
//   _OnBoardViewState createState() => _OnBoardViewState();
// }

// class _OnBoardViewState extends State<OnBoardView> {
//   OnBoardViewModel? viewModel;
//   @override
//   Widget build(BuildContext context) {
//     return BaseView<OnBoardViewModel>(
//         viewModel: OnBoardViewModel(),
//         onDispose: () {},
//         onModelReady: (model) {
//           model.setContext(context);
//           model.init();
//           viewModel = model;
//         },
//         onPageBuild: (BuildContext context, OnBoardViewModel value) => Scaffold(
//               body: Column(
//                 children: [
//                   Expanded(
//                     flex: 9,
//                     child: PageView.builder(
//                       onPageChanged: (value) {
//                         viewModel!.changeCurrentIndex(value);
//                       },
//                       itemCount: viewModel!.onBoardItems.length,
//                       itemBuilder: (context, index) => formColumnContainer(context),
//                     ),
//                   ),
//                   Expanded(
//                       child: IndicatorListView(
//                     itemCount: viewModel!.onBoardItems.length,
//                     currentIndex: viewModel!.currentIndex,
//                   )),
//                 ],
//               ),
//             ));
//   }

//   Container formColumnContainer(BuildContext context) {
//     return Container(
//                       color: context.randomColor,
//                       child: FormColumn(
//                         children: [Placeholder(), Text("data")],
//                       ),
//                     );
//   }
// }
