import 'package:mobile_registry/domain/authentication/di/authentication_domain_dependencies.dart';
import 'package:mobile_registry/feature/authentication/di/authentication_feature_dependencies.dart';
import 'package:mobile_registry/feature/home/di/home_feature_dependencies.dart';
import 'package:mobile_registry/feature/management_report/di/management_report_feature_dependencies.dart';
import 'package:mobile_registry/feature/operative/di/operative_feature_dependencies.dart';
import 'package:mobile_registry/shared_library/service_locator/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Injection {
  Future<void> initialize() async {
    await _registerCoreDependencies();
    _registerFeatureDependencies();
    _registerDomainDependencies();
  }

  void _registerDomainDependencies() {
    AuthenticationDomainDependencies();
  }

  void _registerFeatureDependencies() {
    AuthenticationFeatureDependencies();
    HomeFeatureDependencies();
    ManagementReportFeatureDependencies();
    OperativeFeatureDependencies();
  }

  Future<void> _registerCoreDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => http.Client());
    sl.registerLazySingleton(() => sharedPreferences);
  }
}
