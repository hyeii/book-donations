import 'package:bookdone/bookinfo/model/region.dart';
import 'package:bookdone/bookinfo/page/bookinfo_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegionDialog extends HookConsumerWidget {
  const RegionDialog({super.key, required this.regionList});
  final List<RegionInfo> regionList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedRegionIndex = useState(0);
    var selectedRegionCode = useState('');
    return Dialog(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                "지역을 선택해주세요",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: regionList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        selectedRegionIndex.value = index;
                        selectedRegionCode.value =
                            regionList[index].secondList[0].code;
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          decoration: selectedRegionIndex.value == index
                              ? BoxDecoration(
                                  color: Colors.brown.shade300,
                                  borderRadius: BorderRadius.circular(10))
                              : BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 4.0, bottom: 4.0),
                            child: Center(
                              child: Text(
                                regionList[index].first,
                                style: TextStyle(
                                    color: selectedRegionIndex.value == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight:
                                        selectedRegionIndex.value == index
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    ref
                        .read(regionNameStateProvider.notifier)
                        .setRegion(regionList[selectedRegionIndex.value].first);
                    ref
                        .read(regionStateProvider.notifier)
                        .setRegion(selectedRegionCode.value);
                    ref
                        .read(regionIndexStateProvider.notifier)
                        .setRegion(selectedRegionIndex.value);
                    context.pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    backgroundColor: Colors.brown.shade200,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "완료",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
