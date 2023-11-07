import 'dart:convert';

import 'package:bookdone/bookinfo/widgets/donating_list.dart';
import 'package:bookdone/bookinfo/widgets/keeping_list.dart';
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
                          ref
                              .read(regionStateProvider.notifier)
                              .setRegion('주소변경값');
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
                    // Container(
                    //   width: double.infinity,
                    //   height: 120,
                    //   decoration: BoxDecoration(
                    //     color: Colors.grey.shade200,
                    //     borderRadius: BorderRadius.circular(20.0),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    //     child: Row(
                    //       children: [
                    //         SizedBox(
                    //           width: 20,
                    //         ),
                    //         ClipRRect(
                    //           borderRadius: BorderRadius.circular(15.0),
                    //           child: CachedNetworkImage(
                    //             width: 80,
                    //             height: 80,
                    //             fit: BoxFit.cover,
                    //             alignment: Alignment.topCenter,
                    //             imageUrl:
                    //                 "https://image.aladin.co.kr/product/29045/74/cover500/k192836746_2.jpg",
                    //             placeholder: (context, url) =>
                    //                 CircularProgressIndicator(),
                    //             errorWidget: (context, url, error) =>
                    //                 Icon(Icons.error),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 20,
                    //         ),
                    //         Flexible(
                    //           child: Padding(
                    //             padding: const EdgeInsets.only(
                    //                 top: 10.0, bottom: 10.0),
                    //             child: Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               mainAxisAlignment:
                    //                   MainAxisAlignment.spaceBetween,
                    //               children: [
                    //                 Text(
                    //                   "방금 떠나온 세계",
                    //                   style: TextStyle(
                    //                       fontWeight: FontWeight.bold),
                    //                 ),
                    //                 Text(
                    //                   "김초엽 지음",
                    //                   style: TextStyle(
                    //                       color: Colors.grey.shade600),
                    //                 ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 20,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
                      child: DonatingList(),
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
