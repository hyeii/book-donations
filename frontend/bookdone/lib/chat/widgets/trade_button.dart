import 'package:bookdone/article/model/article_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../rest_api/rest_client.dart';

class TradeButton extends HookConsumerWidget {
  final tradeId;

  const TradeButton({super.key, required this.tradeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restClient = ref.read(restApiClientProvider);
    final userId = useState<int>(-1);

    final receiveUserId = useState<int>(-1);
    final tradeStatus = useState<String?>(null);

    final isLeftButtonPressed = useState<bool>(false);
    final isRightButtonPressed = useState<bool>(false);

    // 유저 정보 읽기
    Future<void> readUserInfo() async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      userId.value = pref.getInt('userId') ?? 0;
    }

    // 거래 정보 가져오기
    fetchTradeInfo() async {
      try {
        await readUserInfo();
        final donationId = await restClient.getDonationIdByTradeId(tradeId);
        receiveUserId.value = donationId.data.memberId;
        tradeStatus.value = donationId.data.tradeStatus;

        print(receiveUserId.value);
        print(tradeStatus.value);
      } catch (e) {
        print('Error fetching trade widget call info: $e');
      }
    }

    useEffect(() {
      fetchTradeInfo();
    }, []);

    /// 왼쪽 버튼 활성화 조건
    bool isLeftButtonEnabled() {
      return !isLeftButtonPressed.value &&
          userId.value != receiveUserId.value &&
          (tradeStatus.value == "DONATION_REQUESTED" || tradeStatus.value == "COMPLETION_REQUESTED");
    }

    /// 오른쪽 버튼 활성화 조건
    bool isRightButtonEnabled() {
      return !isRightButtonPressed.value &&
          userId.value == receiveUserId.value &&
          (tradeStatus.value == "NONE" || tradeStatus.value == "DONATION_CONFIRMED");
    }

    /// 왼쪽 버튼 액션
    leftButtonAction() {
      if (isLeftButtonEnabled()) {
        isLeftButtonPressed.value = true; // 버튼이 눌렸음을 표시
        print("left 서버로 요청 보내기 dummy ------------------------------");
        // TODO: 서버에 요청 보내는 로직 추가
      }
    }

    /// 오른쪽 버튼 액션
    rightButtonAction() {
      if (isRightButtonEnabled()) {
        isRightButtonPressed.value = true; // 버튼이 눌렸음을 표시
        print("right 서버로 요청 보내기 dummy ------------------------------");
        // TODO: 서버에 요청 보내는 로직 추가
      }
    }

    // 버튼 텍스트 변경
    String leftButtonText() {
      switch (tradeStatus.value) {
        case "DONATION_REQUESTED":
          return "완료 확인";
        default:
          return "기부 완료";
      }
    }

    String rightButtonText() {
      switch (tradeStatus.value) {
        case "NONE":
          return "기부 예약";
        case "DONATION_CONFIRMED":
          return "예약 확인";
        default:
          return "";
      }
    }

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: isLeftButtonEnabled() ? leftButtonAction : null,
              child: Text(leftButtonText()),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: isRightButtonEnabled() ? rightButtonAction : null,
              child: Text(rightButtonText()),
            ),
          ),
        ],
      ),
    );
  }
}