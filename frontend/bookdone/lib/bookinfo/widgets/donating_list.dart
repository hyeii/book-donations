import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/bookinfo/widgets/donating_card.dart';
import 'package:bookdone/rest_api/rest_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DonatingList extends HookConsumerWidget {
  const DonatingList({super.key, required this.isbn, required this.code});
  final String isbn;
  final String code;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);
    return FutureBuilder(
      future: restClient.getDonationByRegion(isbn, code),
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
        final donateList = snapshot.data!.data;

        return donateList != null
            ? ListView.separated(
                itemCount: donateList.length,
                itemBuilder: (context, index) {
                  return DonatingCard(isbn: isbn, donation: donateList![index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(),
              )
            : Text('기부중인 책이 없어요');
      },
    );
  }
}
