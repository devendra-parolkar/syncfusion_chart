
import 'package:flutter/material.dart';

import 'model/data_model.dart';
import 'dart:math' as math;


class HomeViewModel extends ChangeNotifier{
  List<MainList> mainList = [];


  void initMainList(String continent, String value, int index, int? id){
    if(id == null){
      mainList.add(MainList(continent, value, math.Random.secure().nextInt(10000000)));
    }
    // else{
    //   mainList[index].title = title;
    //   mainList[index].description = des;
    // }
    notifyListeners();
  }
}