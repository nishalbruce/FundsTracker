import 'package:flutter/material.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:funds_tracker/features/requesteractions/screens/history.dart';
import 'package:funds_tracker/features/requesteractions/screens/profile.dart';
import 'package:funds_tracker/utils/helpers/helper_functions.dart';

import '../../features/requesteractions/screens/home.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(NavigationController());
    final darkMode = FHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? FColors.black : FColors.white,
          indicatorColor: darkMode ? FColors.white.withOpacity(0.1) : FColors.black.withOpacity(0.1),
          shadowColor: Colors.grey,

          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              selectedIcon: Icon(Iconsax.home_15, color: Color(0xFF40A6DD)),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.history),
              selectedIcon: Icon(Icons.history, color: Color(0xFF40A6DD)),
              label: "History",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.frame_1),
              selectedIcon: Icon(Iconsax.frame5, color: Color(0xFF40A6DD)),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const Home(),
    const History(),
    const Profile(),
  ];
}
