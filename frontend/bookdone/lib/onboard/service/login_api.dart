import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class LoginApi {
  String baseURL = dotenv.get('API_URL');

  static Future<void> kakaoLogin() async {
    if (await isKakaoTalkInstalled()) {
      debugPrint('카톡으루로그잉');
      try {
        await UserApi.instance.loginWithKakaoTalk();
        print('카카오톡으로 로그인 성공');
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      debugPrint('계정로긍이');
      // debugPrint(await KakaoSdk.origin);
      try {
        await UserApi.instance.loginWithKakaoAccount();
        debugPrint('카카오계정으로 로그인 성공');
        if (await checkHasToken()) {
          var token = await TokenManagerProvider.instance.manager.getToken();
          debugPrint('토큰냠냠 ${token!.accessToken}');
        }
      } catch (error) {
        debugPrint('카카오계정으로 로그인 실패 $error');
      }
    }
  }

  static Future<bool> checkHasToken() async {
    if (await AuthApi.instance.hasToken()) {
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        debugPrint('토큰 유효성 체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
        return true;
      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료 $error');
        } else {
          print('토큰 정보 조회 실패 $error');
        }
        return false;

        // try {
        //   // 카카오계정으로 로그인
        //   OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
        //   print('로그인 성공 ${token.accessToken}');
        // } catch (error) {
        //   print('로그인 실패 $error');
      }
    } else {
      print('발급된 토큰 없음');

      return false;
    }
  }
}
