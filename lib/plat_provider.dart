import 'package:flutter/cupertino.dart';

class PlatProvider extends ChangeNotifier {
  bool iOS = false;

  void changePlatform(bool n) {
    iOS = n;
    notifyListeners();
  }
}
