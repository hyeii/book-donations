import 'package:bookdone/onboard/model/user_res.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

// 토큰을 riverpod에 저장함

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => UserRepository(ref);

class UserRepository {
  UserRepository(this.ref);
  UserRepositoryRef ref;

  Future<String> restoreAuth() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? accessToken = pref.getString('accessToken') ?? '';

    return accessToken;
  }
}

@riverpod
UserDataRepository userDataRepository(UserDataRepositoryRef ref) =>
    UserDataRepository(ref);

class UserDataRepository {
  UserDataRepository(this.ref);
  UserDataRepositoryRef ref;

  Future<int> restoreId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int id = pref.getInt('id') ?? 0;
    return id;
  }

  Future<String> restoreOauthId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String oauthId = pref.getString('oauthId') ?? '';
    return oauthId;
  }

  Future<String> restoreNickname() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String nickname = pref.getString('nickname') ?? '';
    return nickname;
  }

  Future<String> restoreAddress() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String address = pref.getString('address') ?? '';
    return address;
  }

  Future<int> restorePoint() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    int point = pref.getInt('bookmarkCnt') ?? 0;
    return point;
  }

  Future<String> restoreEmail() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String email = pref.getString('email') ?? '';
    return email;
  }

  Future<String> restoreImage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String image = pref.getString('image') ?? '';
    return image;
  }
}
