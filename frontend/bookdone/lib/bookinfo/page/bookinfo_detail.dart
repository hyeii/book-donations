import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookinfoDetail extends StatefulWidget {
  const BookinfoDetail({super.key});

  @override
  State<BookinfoDetail> createState() => _BookinfoDetailState();
}

class _BookinfoDetailState extends State<BookinfoDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> tabs = <Tab>[
    Tab(
      text: '기부 중',
    ),
    Tab(
      text: "보유 중",
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
        appBar: AppBar(
          // backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: 지역 설정 팝업 열기
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          textStyle: const TextStyle(
                              fontSize: 13, fontFamily: "SCDream4"),
                          backgroundColor: Colors.brown.shade100,
                          foregroundColor: Colors.black87),
                      // TODO: 버튼 사이즈 child 맞춤으로 적용하기
                      child: Wrap(
                        children: [
                          Icon(Icons.location_on, size: 17),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text("인천광역시 연수구"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: CachedNetworkImage(
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                              imageUrl:
                                  "https://image.aladin.co.kr/product/29045/74/cover500/k192836746_2.jpg",
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "방금 떠나온 세계",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "김초엽 지음",
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            TabBar(
              tabs: tabs,
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.brown,
              indicatorSize: TabBarIndicatorSize.tab,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              // indicatorWeight: 2,
              // indicatorPadding:
              //     EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
              labelColor: Colors.black,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: DonatingList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: KeepingList(),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class SelectedAddress extends StatefulWidget {
  const SelectedAddress({super.key});

  @override
  State<SelectedAddress> createState() => _SelectedAddressState();
}

class _SelectedAddressState extends State<SelectedAddress> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          const Icon(Icons.location_on),
          Text(
            "서울시 구로구",
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class DonatingCard extends StatefulWidget {
  const DonatingCard({super.key});

  @override
  State<DonatingCard> createState() => _DonatingCardState();
}

class _DonatingCardState extends State<DonatingCard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style:
          TextStyle(fontSize: 16, color: Colors.black, fontFamily: "SCDream4"),
      child: Column(
        children: [
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("000님의 책"),
              Text("2099-99-99"),
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("히스토리 개수"),
              Text("서울시 영등포구"),
            ],
          ),
          SizedBox(
            height: 7.0,
          ),
          Divider(),
        ],
      ),
    );
  }
}

class DonatingList extends StatefulWidget {
  const DonatingList({super.key});

  @override
  State<DonatingList> createState() => _DonatingListState();
}

class _DonatingListState extends State<DonatingList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
        DonatingCard(),
      ],
    );
  }
}

class KeepingCard extends StatefulWidget {
  const KeepingCard({super.key});

  @override
  State<KeepingCard> createState() => _KeepingCardState();
}

class _KeepingCardState extends State<KeepingCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 13.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "서울시 양천구에 3권의 책이 있어요",
              style: TextStyle(fontSize: 17),
            ),
            IconButton(
              onPressed: () {
                // TODO: 책 알림 구현하기
              },
              icon: Icon(Icons.notifications, size: 20),
            ),
          ],
        ),
        SizedBox(height: 13.0),
        Divider(),
      ],
    );
  }
}

class KeepingList extends StatefulWidget {
  const KeepingList({super.key});

  @override
  State<KeepingList> createState() => _KeepingListState();
}

class _KeepingListState extends State<KeepingList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        KeepingCard(),
        KeepingCard(),
        KeepingCard(),
        KeepingCard(),
        KeepingCard(),
        KeepingCard(),
        KeepingCard(),
      ],
    );
  }
}
