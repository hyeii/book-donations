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
            child: histories.value == null
                ? Text('히스토리가 없습니다')
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
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                color: Color.fromARGB(255, 159, 157, 154),
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
                                            histories.value![index].content),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              histories.value![index].nickname),
                                          Text('작성시간 '),
                                        ],
                                      ),
                                    ],
                                  ),
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
