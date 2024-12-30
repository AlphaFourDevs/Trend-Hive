import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendhive/screens/bag/bag.dart';

import '../../home/home.dart';

class ControllerNavigationbar extends GetxController {
   Rx<int> currentIndex = Rx(2);
  List<Widget> navScreens =[
    Home(),
    Container(color: Colors.blue,),
    Bag(),
    Container(color: Colors.green,),
    Container(color: Colors.amber,),
  ];
}
