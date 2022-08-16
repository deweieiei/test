import 'package:flutter/material.dart';

class HomeFix extends StatefulWidget {
  const HomeFix({Key? key}) : super(key: key);

  @override
  State<HomeFix> createState() => _HomeFixState();
}

class _HomeFixState extends State<HomeFix> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  // indicatorSize: TabBarIndicatorSize.label,
                  // indicator: ,
                  tabs: [
                    Tab(text: 'Places'),
                    Tab(text: 'Inspiration'),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (_, i) {
                        return GestureDetector(
                            onTap: () {
                              print(i);
                            },
                            child: Container(
                              width: 200,
                              height: 300,
                              margin: const EdgeInsets.only(
                                  right: 10, top: 10, bottom: 0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/car.png"),
                                    fit: BoxFit.fitHeight),
                              ),
                            ));
                      }),
                  Text("data"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
