import 'package:shared_preferences/shared_preferences.dart';

class ManagementReportLocalDatasource {
  final SharedPreferences sharedPreferences;
  ManagementReportLocalDatasource({required this.sharedPreferences});
}