import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier{
  int currentIndex = 0;


  changeInadex(int index){
    currentIndex = index;
    notifyListeners();
  }
}