import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class XSizes{

  static double xHeight (double size){
    return Get.height*size;
  }
  static double xWidth (double size){
    return Get.width*size;
  }
  static Widget boxHeight (double size){
    return SizedBox(height: Get.height*size,);
  }
  static Widget boxWidth (double size){
    return SizedBox(width: Get.width*size,);
  }
}