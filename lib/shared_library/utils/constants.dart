class Constants {
  static REApi reAPI = const REApi();
  static RERoute reRoute = const RERoute();
  static RECached reCached = const RECached();

  static const String appName = 'Registry App';
}

class REApi {
  const REApi();
  String get endpoint => 'inashoulder-registry.com';
  String get login => '/api/login';
  String get patient => '/api/patient';
  String get domainCase => '/api/domain-case';
  String get preOperatives => '/api/preoperative';
  String get intraOperatives => '/api/intraoperative';
  String get postOperatives => '/api/postoperative';
  String get prePatients => '/api/preoperative-patient-list';
  String get addPreOperative => '/api/preoperative';
  String get hospital => '/api/hospital';
}

class RERoute {
  const RERoute();

  /// Authentication.
  String get initial => '/';
  String get login => '/auth/login';
  String get home => '/home';

  // Operative.
  String get addPreOperative => '/operative/pre-operative/add';
  String get addIntraOperative => '/operative/intra-operative/add';
  String get addPostOperative => '/operative/post-operative/add';

  // Add Patient.
  String get addPatient => '/management/patient/add';
}

class RECached {
  const RECached();

  String get token => 'CACHED_TOKEN';
}
