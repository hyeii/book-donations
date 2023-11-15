import 'dart:convert';

import 'package:bookdone/bookinfo/model/donation.dart';
import 'package:bookdone/bookinfo/model/region.dart';
import 'package:bookdone/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class DonatingCard extends HookWidget {
  const DonatingCard({super.key, required this.isbn, required this.donation});
  final String isbn;
  final DonationByRegion donation;

  @override
  Widget build(BuildContext context) {
    final date = useState('2028-13-32');
    var regionList = useState<List<RegionInfo>>([]);
    var regionCode = useState('');
    var regionName = useState('');
    var dateData = useState(donation.createdAt.split('T')[0]);
    var timeData = useState(donation.createdAt.split('T')[1]);

    Future<List<RegionInfo>> readJson() async {
      final jsonString =
          await rootBundle.loadString("assets/json/localcode.json");
      final response = await json.decode(jsonString) as Map<String, dynamic>;
      final result = Region.fromJson(response);
      print('데이터 확인 : ${result.region[0].first}');
      return result.region;
    }

    Future<String> getAddressName() async {
      var addressName = '';
      bool stop = false;
      for (int i = 0; i < regionList.value.length; i++) {
        if (!stop) {
          for (int j = 0; j < regionList.value[i].secondList.length; j++) {
            if (regionList.value[i].secondList[j].code == donation.address) {
              addressName = regionList.value[i].secondList[j].name;
              print('여기가 지역이얌 : $addressName, ${donation.nickname}');
              stop = true;
              break;
            }
          }
        }
      }
      return addressName;
    }

    useEffect(() {
      void fetchData() async {
        try {
          final json = await readJson();
          regionList.value = json;
          final address = await getAddressName();
          regionName.value = address;
        } catch (error) {
          print(error);
        }
      }

      fetchData();
    }, []);

    return GestureDetector(
      onTap: () {
        ArticleMainRoute(isbn: isbn, id: donation.id).push(context);
      },
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(donation.nickname),
                Text(dateData.value),
              ],
            ),
            SizedBox(
              height: 7.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${donation.historyCount}개의 히스토리'),
                Text(regionName.value),
              ],
            ),
            SizedBox(
              height: 13,
            ),
          ],
        ),
      ),
    );
  }
}
