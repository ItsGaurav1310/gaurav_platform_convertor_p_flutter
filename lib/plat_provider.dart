import 'package:flutter/cupertino.dart';

class PlatProvider extends ChangeNotifier {
  bool iOS = false;
  DateTime? initialDate = DateTime.now();

  void changePlatform(bool n) {
    iOS = n;
    notifyListeners();
  }

  void datePick(DateTime n) {
    initialDate = n;
    notifyListeners();
  }
}
