import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier{
  int value = 0;
  void increment(){
    value ++;
    notifyListeners();
    print("+1");
  }
}