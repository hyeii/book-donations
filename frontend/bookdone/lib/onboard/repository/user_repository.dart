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
