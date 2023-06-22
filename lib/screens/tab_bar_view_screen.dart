import 'package:flutter/material.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({Key? key}) : super(key: key);

  @override
  State<TabBarViewScreen> createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        // Changes the way the inner and outer scroll are linked together
        floatHeaderSlivers: true,
        // This builds the scrollable content above the body
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // This redirects the amount of the overlap to the injector
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              title: Container(
                color: Colors.green,
                height: 250,
              ),
              stretch: true,
              expandedHeight: 250,
              floating: true,
              snap: true,
              forceElevated: innerBoxIsScrolled,
            ),
          ),
        ],
        // The content of the scroll view
        body: Builder(builder: (context) {
          return TabBarView(
            controller: _tabController,
            children: [
              Expanded(
                  child: CustomScrollView(
                slivers: [
                  // Injects the overlapped amount into the scrollable area
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(
                        title: Text(
                          'Text $index',
                        ),
                      ),
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: CustomScrollView(
                slivers: [
                  // Injects the overlapped amount into the scrollable area
                  SliverOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ListTile(
                        title: Text(
                          'Text $index',
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ],
          );
          // return CustomScrollView(
          //   slivers: [
          //     // Injects the overlapped amount into the scrollable area
          //     SliverOverlapInjector(
          //       handle:
          //           NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          //     ),
          //     SliverList(
          //       delegate: SliverChildBuilderDelegate(
          //         (context, index) => ListTile(
          //           title: Text(
          //             'Text $index',
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // );
        }),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Column(
  //       children: [
  //         NestedScrollView(
  //             headerSliverBuilder: (context, innerBoxIsScrolled) => [
  //                   Container(
  //                       height: MediaQuery.of(context).size.height * 0.4,
  //                       child: Image.asset("assets/images/أحبك.png"))
  //                 ],
  //             body: Container(
  //               height: MediaQuery.of(context).size.height * 0.4,
  //               child: TabBarView(
  //                 controller: _tabController,
  //                 children: [
  //                   Container(
  //                     height: 80,
  //                     color: Colors.black,
  //                   ),
  //                   Container(
  //                     height: 80,
  //                     color: Colors.grey,
  //                   ),
  //                   Container(
  //                     height: 80,
  //                     color: Colors.green,
  //                   ),
  //                 ],
  //               ),
  //             )),
  //       ],
  //     ),
  //   );
  // }
}
