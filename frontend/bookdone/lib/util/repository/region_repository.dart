import 'dart:convert';

import 'package:bookdone/bookinfo/model/region.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'region_repository.g.dart';

@riverpod
RegionRepository regionRepository(RegionRepositoryRef ref) =>
    RegionRepository();

class RegionRepository {
  Future<Region> fetchRegion() async {
    final jsonString =
        await rootBundle.loadString("assets/json/localcode.json");
    final response = await json.decode(jsonString) as Map<String, dynamic>;
    final result = Region.fromJson(response);

    return result;
  }
}
