import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendhive/screens/bag/bag.dart';

import '../../home/home.dart';

class ControllerNavigationbar extends GetxController {
  RxInt currentIndex = 0.obs;

  static BottomNavigationBarItem _navItem (IconData icon,String label){
    return BottomNavigationBarItem(icon: Icon(icon),label: label);
  }

  final List<BottomNavigationBarItem> navItems=[
    _navItem(Icons.home_filled, "Home"),
    _navItem(Icons.shopping_cart_outlined, "Shop"),
    _navItem(Icons.shopping_bag_outlined, "Bag"),
    _navItem(Icons.favorite_border, "Favourites"),
    _navItem(Icons.person, "Profile"),
  ];

  final List<Widget> navScreens = [
    const Home(),
    Container(color: Colors.blue),
    const Bag(),
    Container(color: Colors.green),
    Container(color: Colors.amber),
  ];
}
