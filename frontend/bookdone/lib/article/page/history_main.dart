import 'package:bookdone/article/model/article_data.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryMain extends HookConsumerWidget {
  const HistoryMain(
      {super.key,
      required this.title,
      required this.titleUrl,
      required this.donationId});
  final int donationId;
  final String title;
  final String titleUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 238, 236, 233),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                title,
                style: TextStyle(fontSize: 15),
              ),
              background: Container(
                // color: Color(0xff928C85),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(titleUrl),
                    fit: BoxFit.cover,
                    opacity: 0.5,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: restClient.getHistoriesByDonation(donationId),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.data == null) {
                  // print(snapshot.data);
                  // return SizedBox.shrink();
                  return Text('히스토리가 null임');
                }

                if (snapshot.data!.data != null &&
                    snapshot.data!.data!.isEmpty) {
                  // return SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 30,
                      right: 30,
                    ),
                    child: Text('아직 작성된 히스토리가 없습니다'),
                  );
                }

                final historyList = snapshot.data!.data!;
                return Text('test');

                // return Expanded(
                //   child: ListView.builder(
                //     itemCount: historyList.length,
                //     itemBuilder: (context, index) {
                //       return ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //         child: Container(
                //           color: Color.fromARGB(255, 159, 157, 154),
                //           height: 200,
                //           child: Padding(
                //             padding: const EdgeInsets.all(30.0),
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Align(
                //                   alignment: Alignment.centerLeft,
                //                   child: Text('테스트'),
                //                 ),
                //                 Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment.spaceBetween,
                //                   children: [
                //                     Text('테스트틍ㅇ'),
                //                     Text('작성시간 '),
                //                   ],
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
