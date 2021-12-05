import 'package:mobile_registry/shared_library/exception/cache_exceptions.dart';
import 'package:mobile_registry/shared_library/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationLocalDatasource {
  final SharedPreferences sharedPreferences;
  AuthenticationLocalDatasource({required this.sharedPreferences});

  Future<void> cacheToken(String cache) {
    return sharedPreferences.setString(
      Constants.reCached.token,
      cache,
    );
  }

  Future<void> clearToken() {
    return sharedPreferences.clear();
  }

  Future<String> getToken() {
    final value = sharedPreferences.getString(Constants.reCached.token);
    if (value != null) {
      return Future.value(value);
    } else {
      throw CacheException('Failed get token');
    }
  }
}
