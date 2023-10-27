import 'package:flutter/material.dart';

class MyPageMain extends StatefulWidget {
  const MyPageMain({Key? key}) : super(key: key);

  @override
  State<MyPageMain> createState() => _MyPageMainState();
}

class _MyPageMainState extends State<MyPageMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> tabs = <Tab>[
    Tab(
      text: '기부 중',
    ),
    Tab(
      text: "보유 중",
    ),
    Tab(
      text: "관심도서",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: tabs.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0, right: 50.0),
            child: Column(
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100.0),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/samplebookcover.jpg"),
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("000님의 서재"),
                              Text("책갈피 3개"),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {
                          // TODO: MyPageNotification으로 이동
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.zero,
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 5.0),
                          // tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          shape: RoundedRectangleBorder(
                              //모서리를 둥글게
                              borderRadius: BorderRadius.circular(8)),
                          textStyle: const TextStyle(fontSize: 12),
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white),
                      child: Text(
                        "히스토리 작성",
                        style: TextStyle(fontFamily: "SCDream4"),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TabBar(
            tabs: tabs,
            controller: _tabController,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.brown,
            indicatorSize: TabBarIndicatorSize.tab,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            labelColor: Colors.black,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabs.map((tab) {
                return Center(
                  child: Text(
                    "${tab.text}",
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
