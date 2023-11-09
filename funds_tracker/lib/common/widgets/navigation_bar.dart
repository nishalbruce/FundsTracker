import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:funds_tracker/screens/requester/history.dart';
import 'package:funds_tracker/screens/requester/home.dart';
import 'package:funds_tracker/screens/requester/profile.dart';
import 'package:funds_tracker/utils/helpers/helper_functions.dart';

class NavigBar extends StatelessWidget {
  const NavigBar({super.key});

  @override
  Widget build(BuildContext context) {

    //final controller = Get.put(NavigationController());
    //final darkMode = FHelperFunctions.isDarkMode(context);

    //return Scaffold(
    //  bottomNavigationBar: NavigationBar(
    //    elevation: 0,
    //    //selectedIndex: controller.selectedIndex.value,
    //    //onDestinationSelected: (index) => controller.selectedIndex.value = index,
    //    destinations: const [
    //      NavigationDestination(
    //        icon: Icon(Iconsax.home),
    //        selectedIcon: Icon(Iconsax.home_15),
    //        label: "",
    //      ),
    //      NavigationDestination(
    //        icon: Icon(Iconsax.clock),
    //        selectedIcon: Icon(Icons.history),
    //        label: "History",
    //      ),
    //      NavigationDestination(
    //        icon: Icon(Iconsax.profile),
    //        selectedIcon: Icon(Icons.person),
    //        label: "Profile",
    //      ),
    //    ],
    //  ),
    //  //body: Obx(() => controller.screens[controller.selectedIndex.value]),
    //);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            activeIcon: Icon(Iconsax.home_15),
            label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.clock),
            activeIcon: Icon(Icons.history),
              label: ""
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile),
            activeIcon: Icon(Icons.person),
              label: ""
          ),
        ],
      ),
    );
  }
}


//class NavigationController extends GetxController{
//  final Rx<int> selectedIndex = 0.obs;
//
//  final screens = [
//    const Home(),
//    const History(),
//    const Profile(),
//  ];
//}
