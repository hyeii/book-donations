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
      backgroundColor: Color.fromARGB(255, 238, 236, 233),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(Icons.menu),
            // title: Text('책제목이얌'),
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('책제목'),
              background: Container(
                color: Color(0xff928C85),
              ),
            ),
          ),
          FutureBuilder(
            future: restClient.getHistoriesByDonation(donationId),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
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

              if (snapshot.data!.data != null && snapshot.data!.data!.isEmpty) {
                // return SizedBox.shrink();
                return SizedBox(
                  height: 10,
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
                                  child: Text('테스트')),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                ),
              ),
            ),
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
                ),
              ),
            ),
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
                ),
              ),
            ),
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
                ),
              ),
            ),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
