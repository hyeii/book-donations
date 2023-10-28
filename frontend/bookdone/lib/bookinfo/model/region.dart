import 'package:bookdone/bookinfo/model/under_region.dart';

class Region {
  String first;
  List<UnderRegion> secondList;

  Region({
    required this.first,
    required this.secondList,
  });

  factory Region.fromJson(Map<String, dynamic> volumeInfo) {
    return Region(
      first: volumeInfo["first"] ?? "",
      secondList: volumeInfo["secondList"] ?? [],
    );
  }
}
