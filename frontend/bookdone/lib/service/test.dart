import 'package:bookdone/service/news_test.dart';
import 'package:bookdone/service/rest_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TestPage extends HookWidget {
  const TestPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final hackerNewsRepository = useMemoized(() => HackerNewsRepository(Dio()));

    return Scaffold(
      body: FutureBuilder<List<int>>(
        future: hackerNewsRepository.getTopNews(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final ids = snapshot.data;

          return ListView.builder(
            itemBuilder: (_, index) {
              return FutureBuilder<RestClient>(
                future: hackerNewsRepository.getNewsModelDetail(ids![index]),
                builder: ((_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.data is RestClient) {
                    return _newsCardWidget(snapshot.data as RestClient);
                  }

                  return Text("${snapshot.data}");
                }),
              );
            },
            itemCount: ids!.length,
          );
        },
      ),
    );
  }

  Widget _newsCardWidget(RestClient news) {
    return Column(
      children: [
        Text(news.id.toString()),
        Text(news.title),
        Text(news.url),
      ],
    );
  }
}
