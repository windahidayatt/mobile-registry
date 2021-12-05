class Constants {
  static REApi reAPI = const REApi();
  static RERoute reRoute = const RERoute();
  static RECached reCached = const RECached();

  static const String appName = 'Registry App';
}

class REApi {
  const REApi();
  String get endpoint => '10.0.2.2:8000';
  String get login => '/api/login';
  String get patient => '/api/patient';
  String get preOperatives => '/api/preoperative';
  String get intraOperatives => '/api/intraoperative';
}

class RERoute {
  const RERoute();

  /// Authentication.
  String get initial => '/';
  String get login => '/auth/login';
  String get home => '/home';
}

class RECached {
  const RECached();

  String get token => 'CACHED_TOKEN';
}
