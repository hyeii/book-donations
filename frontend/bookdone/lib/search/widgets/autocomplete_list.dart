import 'package:flutter/material.dart';

class AutocompleteList extends StatefulWidget {
  const AutocompleteList({super.key});

  @override
  State<AutocompleteList> createState() => _AutocompleteListState();
}

class _AutocompleteListState extends State<AutocompleteList> {
  @override
  Widget build(BuildContext context) {
    List<String> autolist = [
      '자동완dfsdf성1',
      '자동완sdfsdfsdfsdf성2',
      '자동완성3',
      '자동완성4sdfsdfsesdfsdfsdfsdfsdfsdfsdfsdfsdfsdd'
    ];
    return Positioned(
      top: 55,
      right: 20,
      left: 20,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: autolist.map((item) {
            return GestureDetector(
              onTap: () {
                // TODO: 검색으로 isbn 넘기기
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item,
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
