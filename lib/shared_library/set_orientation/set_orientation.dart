import 'package:flutter/services.dart';

class SetOrientation {
  void setPortrait(){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
  }
}