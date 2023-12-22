import 'package:shared_preferences/shared_preferences.dart';
import 'package:tollxpress/core/errors/exceptions.dart';

abstract class OnBoardingLocalDataSource {
  Future<void> cacheFirstTimer();

  Future<bool> checkIfUserIsFirstTimer();
}

const kFirstTimeKey = 'first_timer';

class OnBoardingLocalDataSourceImpl extends OnBoardingLocalDataSource {
  final SharedPreferences sharedPrefs;

  OnBoardingLocalDataSourceImpl(this.sharedPrefs);

  @override
  Future<void> cacheFirstTimer() async {
    try {
      await sharedPrefs.setBool(kFirstTimeKey, false);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<bool> checkIfUserIsFirstTimer() async {
    try {
      return sharedPrefs.getBool(kFirstTimeKey) ?? true;
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
