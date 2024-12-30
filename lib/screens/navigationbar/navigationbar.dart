import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendhive/screens/navigationbar/controller/controller_navigationbar.dart';

class KNavigationbar extends StatelessWidget {
  KNavigationbar({super.key});

  final controllerNavigationbar = Get.put(ControllerNavigationbar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>controllerNavigationbar.navScreens[controllerNavigationbar.currentIndex.value],),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        child: BottomNavigationBar(
          iconSize: 26,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(color: Colors.red),
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          currentIndex: controllerNavigationbar.currentIndex.value,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index){
            controllerNavigationbar.currentIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home_filled),
            ),
            BottomNavigationBarItem(
              label: "Shop",
              icon: Icon(Icons.shopping_cart_outlined),
            ),
            BottomNavigationBarItem(
              label: "Bag",
              icon: Icon(Icons.shopping_bag_outlined),
            ),
            BottomNavigationBarItem(
              label: "Favourites",
              icon: Icon(Icons.favorite_border),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }
}
