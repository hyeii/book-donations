import 'package:bookdone/article/model/article_data.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryMain extends HookConsumerWidget {
  const HistoryMain({super.key, required this.donationId});
  final int donationId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 238, 236, 233),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // leading: Icon(Icons.menu),
            // title: Text('책제목이얌'),
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('책제목'),
              background: Container(
                // color: Color(0xff928C85),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'http://www.nl.go.kr/seoji/fu/ecip/dbfiles/CIP_FILES_TBL/5642796_3.jpg'),
                    fit: BoxFit.cover,
                    opacity: 0.5,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          FutureBuilder(
            future: restClient.getHistoriesByDonation(donationId),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SliverToBoxAdapter(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (snapshot.data == null) {
                // return SizedBox.shrink();
                return SliverToBoxAdapter(
                  child: Text('아직 작성된 히스토리가 없습니다'),
                );
              }

              if (snapshot.data!.data != null && snapshot.data!.data!.isEmpty) {
                // return SizedBox.shrink();
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                    ),
                    child: Text('아직 작성된 히스토리가 없습니다'),
                  ),
                );
              }

              final historyList = snapshot.data!.data!;

              return ListView(
                  children: historyList.map((history) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Color.fromARGB(255, 159, 157, 154),
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(history.content)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(history.nickname),
                                  Text('작성시간 ${history.createdAt}'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList());
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Color.fromARGB(255, 159, 157, 154),
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('테스트')),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('김싸피'),
                            Text('2099-99-99'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
