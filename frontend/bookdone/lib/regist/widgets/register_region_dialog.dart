import 'package:bookdone/bookinfo/model/region.dart';
import 'package:bookdone/regist/page/regist_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RegisterRegionDialog extends HookConsumerWidget {
  const RegisterRegionDialog({super.key, required this.regionList});
  final List<RegionInfo> regionList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var regionName = useState('');
    var regionCode = useState('');
    var secondRegionList = useState<List<SecondList>>([]);
    var selectedRegionIndex = useState(0);
    var firstRegionIndex = useState(0);
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
                child: Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: regionList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              firstRegionIndex.value = index;
                              secondRegionList.value =
                                  regionList[index].secondList;
                              selectedRegionIndex.value = 0;
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: firstRegionIndex.value == index
                                    ? BoxDecoration(
                                        color: Colors.brown.shade300,
                                        borderRadius: BorderRadius.circular(10))
                                    : BoxDecoration(color: Colors.white),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 4.0, bottom: 4.0),
                                  child: Center(
                                    child: Text(
                                      regionList[index].first,
                                      style: TextStyle(
                                          color: firstRegionIndex.value == index
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight:
                                              firstRegionIndex.value == index
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
                    // if (_secondRegionList.isNotEmpty)
                    Expanded(
                      child: ListView(
                        children: List.generate(
                          secondRegionList.value.length,
                          (index) {
                            final isSelected =
                                selectedRegionIndex.value == index;
                            return GestureDetector(
                              onTap: () {
                                selectedRegionIndex.value = index;
                                regionCode.value =
                                    secondRegionList.value[index].code;
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.brown.shade300
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 4.0, bottom: 4.0),
                                    child: Center(
                                      child: Text(
                                        secondRegionList.value[index].second,
                                        style: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // if (_secondRegionList.isEmpty) Text("선택 ㄱㄱ")
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    regionCode.value =
                        secondRegionList.value[selectedRegionIndex.value].code;

                    regionName.value =
                        secondRegionList.value[selectedRegionIndex.value].name;
                    ref
                        .watch(registerRegionStateProvider.notifier)
                        .setRegion(regionName.value);
                    ref
                        .watch(registerRegionCodeStateProvider.notifier)
                        .setRegion(regionCode.value);

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
