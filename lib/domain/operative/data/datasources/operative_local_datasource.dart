import 'package:shared_preferences/shared_preferences.dart';

class OperativeLocalDatasource {
  final SharedPreferences sharedPreferences;
  OperativeLocalDatasource({required this.sharedPreferences});
}