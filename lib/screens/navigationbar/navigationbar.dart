import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendhive/screens/navigationbar/controller/controller_navigationbar.dart';

class XNavigationbar extends StatelessWidget {
  XNavigationbar({super.key});

  final controllerNavigationbar = Get.put(ControllerNavigationbar());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controllerNavigationbar.currentIndex.value,
            children: controllerNavigationbar.navScreens,
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
          child: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: 26,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: const TextStyle(color: Colors.red),
              unselectedLabelStyle: const TextStyle(color: Colors.grey),
              currentIndex: controllerNavigationbar.currentIndex.value,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: (index) {
                if(controllerNavigationbar.currentIndex.value!=index) {
                  controllerNavigationbar.currentIndex.value = index;
                }
              },
              items: controllerNavigationbar.navItems,
            ),
          ),
        ),
      ),
    );
  }
}
