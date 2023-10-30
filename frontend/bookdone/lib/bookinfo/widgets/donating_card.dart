import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class DonatingCard extends HookWidget {
  const DonatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final donator = useState('기부자이름');
    final historyCount = useState(0);
    final date = useState('2028-13-32');
    final area = useState('서울시 마포구');

    return DefaultTextStyle(
      style:
          TextStyle(fontSize: 16, color: Colors.black, fontFamily: "SCDream4"),
      child: GestureDetector(
        onTap: () {
          context.pushNamed('articlemain');
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
                  Text(donator.value),
                  Text(date.value),
                ],
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${historyCount.value}개의 히스토리'),
                  Text(area.value),
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
