enum HomePageType {
  dashboard,
  patientData,
  report,
  preOperative,
  intraOperative,
  postOperative
}

extension HomePageTypeExtension on HomePageType {
  int get getIndex {
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

  String get title {
    switch (this) {
      case HomePageType.dashboard:
        return 'Dashboard Page';
      case HomePageType.patientData:
        return 'Patient Data Page';
      case HomePageType.report:
        return 'Report Page';
      case HomePageType.preOperative:
        return 'Pre Operative Page';
      case HomePageType.intraOperative:
        return 'Intra Operative Page';
      case HomePageType.postOperative:
        return 'Post Operative Page';
    }
  }
}
