import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class DonatingCard extends HookWidget {
  const DonatingCard({super.key, required this.isbn, required this.donation});
  final String isbn;
  final DonationByRegion donation;

  @override
  Widget build(BuildContext context) {
    final date = useState('2028-13-32');

    return DefaultTextStyle(
      style:
          TextStyle(fontSize: 16, color: Colors.black, fontFamily: "SCDream4"),
      child: GestureDetector(
        onTap: () {
          ArticleMainRoute(isbn: isbn, id: donation.id).push(context);
        },
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(
                height: 7.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(donation.nickname),
                  Text(date.value),
                ],
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${donation.historyCount}개의 히스토리'),
                  Text(donation.address),
                ],
              ),
              SizedBox(
                height: 7.0,
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
