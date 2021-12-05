enum HomePageType {
  dashboard,
  patientData,
  report,
  preOperative,
  intraOperative,
  postOperative
}

extension HomePageTypeExtension on HomePageType {
  int get value {
    switch (this) {
      case HomePageType.dashboard:
        return 0;
      case HomePageType.patientData:
        return 1;
      case HomePageType.report:
        return 2;
      case HomePageType.preOperative:
        return 3;
      case HomePageType.intraOperative:
        return 4;
      case HomePageType.postOperative:
        return 5;
    }
  }
}
