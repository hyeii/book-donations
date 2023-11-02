import 'package:bookdone/search/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AutocompleteList extends HookWidget {
  const AutocompleteList({super.key, required this.autoListData});
  final List<AutoListData> autoListData;

  @override
  Widget build(BuildContext context) {
    // List<String> autolist = [
    //   '자동완dfsdf성1',
    //   '자동완sdfsdfsdfsdf성2',
    //   '자동완성3',
    //   '자동완성4sdfsdfsesdfsdfsdfsdfsdfsdfsdfsdfsdfsdd'
    // ];
    return Positioned(
      top: 55,
      right: 20,
      left: 20,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: autoListData.map((item) {
            return GestureDetector(
              onTap: () {
                // TODO: 검색으로 isbn 넘기기
                print('잘 눌려용');
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
