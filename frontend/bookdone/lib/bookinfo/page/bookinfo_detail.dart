import 'dart:convert';

import 'package:bookdone/bookinfo/model/region.dart';
import 'package:bookdone/bookinfo/widgets/donating_list.dart';
import 'package:bookdone/bookinfo/widgets/keeping_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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

  List _regionList = [];
  List _secondRegionList = [];
  int _firstRegionIndex = 0;
  int _selectedRegionCode = 0;
  int _selectedRegionIndex = 0;
  // String _selectedRegion = "서울특별시 구로구";

  Future<void> readJson() async {
    // final regionData =
    //     await rootBundle.loadString('assets/json/localcode.json');
    // _regionList = RegionList.fromJson(regionData).regions ?? <Region>[];
    // notifyListeners();
    final String res =
        await rootBundle.loadString("assets/json/localcode.json");
    final data = await json.decode(res);
    setState(() {
      _regionList = data["region"];
    });
  }

  void selectAddress(context) {
    showDialog(
      context: context,
      builder: (context) {
        // readJson();
        return StatefulBuilder(builder: (context, setState) {
          return Dialog(
            child: Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      "주소를 선택해주세요",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: _regionList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _secondRegionList =
                                          _regionList[index]["secondList"];
                                      // _secondRegionListIndex = index;
                                      _selectedRegionIndex = 0;
                                      _firstRegionIndex = index;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: _firstRegionIndex == index
                                          ? BoxDecoration(
                                              color: Colors.brown.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(10))
                                          : BoxDecoration(color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, bottom: 4.0),
                                        child: Center(
                                          child: Text(
                                            _regionList[index]["first"],
                                            style: TextStyle(
                                                color:
                                                    _firstRegionIndex == index
                                                        ? Colors.white
                                                        : Colors.black,
                                                fontWeight:
                                                    _firstRegionIndex == index
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // if (_secondRegionList.isNotEmpty)
                          Expanded(
                            child: ListView.builder(
                              itemCount: _secondRegionList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedRegionCode =
                                          _secondRegionList[index]["code"];
                                      _selectedRegionIndex = index;
                                      // _selectedRegion = _secondRegionList[
                                      //     _selectedRegionIndex]["name"];
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: _selectedRegionIndex == index
                                          ? BoxDecoration(
                                              color: Colors.brown.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(10))
                                          : BoxDecoration(color: Colors.white),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 4.0, bottom: 4.0),
                                        child: Center(
                                          child: Text(
                                            _secondRegionList[index]["second"],
                                            style: TextStyle(
                                                color: _selectedRegionIndex ==
                                                        index
                                                    ? Colors.white
                                                    : Colors.black,
                                                fontWeight:
                                                    _selectedRegionIndex ==
                                                            index
                                                        ? FontWeight.bold
                                                        : FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // if (_secondRegionList.isEmpty) Text("선택 ㄱㄱ")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: 지역코드 서버로 보내기
                          // setState(
                          //   () {
                          //     _selectedRegion =
                          //         _secondRegionList[_selectedRegionIndex]
                          //             ["name"];
                          //   },
                          // );
                          context.read<SetNewRegion>().updateSelectedRegion(
                              _secondRegionList[_selectedRegionIndex]["name"]);
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: Colors.brown.shade200,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          "변경하기",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // readJson();
    return StatefulBuilder(builder: (context, setState) {
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
                          readJson();
                          selectAddress(context);
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            textStyle: const TextStyle(
                                fontSize: 13, fontFamily: "SCDream4"),
                            backgroundColor: Colors.brown.shade100,
                            foregroundColor: Colors.black87),
                        child: Wrap(
                          children: [
                            Icon(Icons.location_on, size: 17),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(context.watch<SetNewRegion>().selectedRegion),
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "김초엽 지음",
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
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
    });
  }
}

// class RegionList {
//   final List<Region>? regions;
//   RegionList({this.regions});

//   factory RegionList.fromJson(String jsonString) {
//     List<dynamic> listFromJson = json.decode(jsonString);
//     List<Region> regions = <Region>[];

//     regions = listFromJson.map((region) => Region.fromJson(region)).toList();
//     return RegionList(regions: regions);
//   }
// }

class SetNewRegion with ChangeNotifier {
  String selectedRegion = "서울특별시 구로구";
  // TODO: 로그인 유저 default 주소정보 저장

  void updateSelectedRegion(String value) {
    selectedRegion = value;
    notifyListeners();
  }
}
