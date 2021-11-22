class Constants {
  static REApi reAPI = const REApi();
  static RERoute reRoute = const RERoute();
  static RECached reCached = const RECached();

  static const String appName = 'Registry App';
}

class REApi {
  const REApi();
}

class RERoute {
  const RERoute();

  /// Authentication.
  String get initial => '/';
}

class RECached {
  const RECached();
}
