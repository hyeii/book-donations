import 'dart:math';

import 'package:bookdone/article/model/article_data.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    var histories = useState<List<HistoryData>?>(null);
    Future<HistoryResp> getHistories() async {
      var data = restClient.getHistoriesByDonation(donationId);
      return data;
    }

    final List<Color> lowSaturationColors = [
      const Color.fromARGB(255, 200, 211, 215),
      Color.fromARGB(255, 241, 232, 232),
      Color.fromARGB(255, 237, 241, 243),
      const Color.fromARGB(255, 215, 218, 235),
      Color.fromARGB(255, 227, 235, 234),
    ];

    useEffect(() {
      void fetchData() async {
        try {
          final data = await getHistories();
          histories.value = data.data;
        } catch (error) {
          print(error);
        }
      }

      fetchData();
      return null;
    }, []);

    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 238, 236, 233),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade800,
                  shadows: [
                    Shadow(
                      blurRadius: 7.0, // shadow blur
                      color: Color.fromARGB(255, 86, 86, 86), // shadow color
                      offset: Offset(0.0, 0.0), // how much shadow will be shown
                    ),
                  ],
                ),
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
            child: histories.value == null
                ? Text(' ')
                : histories.value!.isEmpty
                    ? Text('히스토리가 없습니다')
                    : Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ListView.builder(
                          // gridDelegate:
                          //     SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                          itemCount: histories.value != null
                              ? histories.value!.length
                              : 0,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            var date =
                                histories.value![index].createdAt.split('T');
                            var day = date[0];
                            var time = date[1];
                            final randomColorIndex =
                                Random().nextInt(lowSaturationColors.length);
                            final randomColor =
                                lowSaturationColors[randomColorIndex];
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: randomColor,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 196, 196, 196)
                                        .withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 3,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                              ),
                              height: 200,
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        histories.value![index].content,
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(histories.value![index].nickname),
                                        Text('$day $time'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
