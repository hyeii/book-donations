import 'package:bookdone/article/model/article_data.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHistories extends HookConsumerWidget {
  const MyHistories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);
    var histories = useState<List<HistoryData>?>(null);

    Future<HistoryResp> getHistories() async {
      var data = restClient.getMyHistoryWritten();
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 150,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                '히스토리 모아보기',
                style: TextStyle(fontSize: 15),
              ),
              background: Container(
                decoration: BoxDecoration(
                  color: Color(0xff928C85),
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
                            return CachedNetworkImage(
                              imageUrl: histories.value![index].titleUrl,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 196, 196, 196)
                                          .withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 3,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    opacity: 0.5,
                                    alignment: Alignment.topCenter,
                                  ),
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
                                          histories.value![index].content!,
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(histories.value![index].title),
                                          Text('$day $time'),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
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
