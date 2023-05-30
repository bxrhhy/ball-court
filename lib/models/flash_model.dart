import 'package:flutter/cupertino.dart';

///用于广告的显示
class FlashModel extends ChangeNotifier{
  bool showWelcomePage = true;

  closeWelcomePage(){
    showWelcomePage = false;
    notifyListeners();
  }
}