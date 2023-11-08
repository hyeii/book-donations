import 'dart:convert';

import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/bookinfo/model/region.dart';
import 'package:bookdone/bookinfo/widgets/donating_list.dart';
import 'package:bookdone/bookinfo/widgets/keeping_list.dart';
import 'package:bookdone/onboard/repository/user_repository.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider/provider.dart';

class RegionNotifier extends StateNotifier<String> {
  RegionNotifier(this.ref) : super('유저정보주소');

  final Ref ref;
  Future<void> setRegion(String region) async {
    state = region;
  }
}

final regionStateProvider =
    StateNotifierProvider<RegionNotifier, String>((ref) => RegionNotifier(ref));

class BookinfoDetail extends HookConsumerWidget {
  BookinfoDetail({super.key, required this.isbn});
  final String isbn;
  final List<Tab> tabs = <Tab>[
    Tab(
      text: '기부 중',
    ),
    Tab(
      text: "보유 중",
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);
    final regionNow = ref.watch(regionStateProvider);
    final _tabController =
        useTabController(initialLength: tabs.length, initialIndex: 0);
    var regionList = useState<List<RegionInfo>>([]);
    var selectedRegionIndex = useState(0);
    var selectedRegionCode = useState('');
    var donatingList = useState<List<DonationByRegion>>([]);

    Future<void> readJson() async {
      final jsonString =
          await rootBundle.loadString("assets/json/localcode.json");
      final response = await json.decode(jsonString) as Map<String, dynamic>;
      final result = Region.fromJson(response);
      // print('테스트 : ${result.region[0].first}');
      regionList.value = result.region;
      // regionList.value = List<Region>.from(data['region']);
    }

    Future<void> getDonationList() async {
      DonationByRegionData data =
          await restClient.getDonationByRegion(isbn, selectedRegionCode.value);
      donatingList.value = data.data!;
    }

    Future<void> selectAddress(context) async {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Text(
                      "지역을 선택해주세요",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: regionList.value.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              selectedRegionIndex.value = index;
                              selectedRegionCode.value =
                                  regionList.value[index].first;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: selectedRegionIndex.value == index
                                    ? BoxDecoration(
                                        color: Colors.brown.shade300,
                                        borderRadius: BorderRadius.circular(10))
                                    : BoxDecoration(color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, bottom: 4.0),
                                  child: Center(
                                    child: Text(
                                      regionList.value[index].first,
                                      style: TextStyle(
                                          color:
                                              selectedRegionIndex.value == index
                                                  ? Colors.white
                                                  : Colors.black,
                                          fontWeight:
                                              selectedRegionIndex.value == index
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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          // TODO: 지역코드 서버로 보내기
                          // ref
                          //     .read(regionStateProvider.notifier)
                          //     .setRegion(selectedRegionCode.value);
                          // selectedRegionCode.value = regionNow;
                          // DonationByRegionData data = await restClient
                          //     .getDonationByRegion(isbn, "1100");

                          // Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: Colors.brown.shade200,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          "완료",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    // readJson();
    return StatefulBuilder(builder: (context, setState) {
      return Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          readJson();

                          selectAddress(context);
                          // ref
                          //     .read(regionStateProvider.notifier)
                          //     .setRegion('주소변경값');
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
                            Text(regionNow),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FutureBuilder(
                        future: restClient.getDetailBook(isbn),
                        builder: (_, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.data == null) {
                            // return SizedBox.shrink();
                            return SizedBox(
                              height: 10,
                            );
                          }
                          final book = snapshot.data!.data;

                          return Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 15.0, bottom: 15.0),
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
                                      imageUrl: book.titleUrl,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            book.title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            book.author,
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
                          );
                        }),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 12),
                      child: DonatingList(
                          isbn: isbn, donateList: donatingList.value),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 12),
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
