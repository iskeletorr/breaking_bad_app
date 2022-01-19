import 'package:flutter/material.dart';

import '../../../../../core/base/view/base_view.dart';
import '../../../../../core/extensions/context_extension.dart';
import '../viewmodel/build_feed_view_model.dart';

class BuildFeedView extends StatelessWidget {
  const BuildFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<BuildFeedViewModel>(
        viewModel: BuildFeedViewModel(),
        onDispose: () {},
        onModelReady: (model) {
          model.setContext(context);
          model.init();
        },
        onPageBuild: (BuildContext context, BuildFeedViewModel value) => Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
              ),
              body: DefaultTabController(
                length: 4,
                child: ListView(
                  children: [
                    TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
                      Tab(text: "Latest"),
                      Tab(text: "Decor"),
                      Tab(text: "Music"),
                      Tab(text: "Style"),
                    ]),
                    SizedBox(
                      height: 300,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              bottom: 125,
                              child: Container(
                                color: Colors.red,
                              )),
                          Positioned(
                              top: 150,
                              left: 10,
                              right: 10,
                              child: Container(
                                color: Colors.blue,
                                child: Padding(
                                  padding: context.allLowH,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.zero,
                                        leading: CircleAvatar(),
                                        title: Text("asdhas"),
                                        subtitle: Text("sdasda"),
                                        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
                                      ),
                                      Text(
                                        "sjkdsa",
                                        style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                      Text("skldjalsj"),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
