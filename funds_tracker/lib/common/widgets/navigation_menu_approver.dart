import 'package:flutter/material.dart';
import 'package:funds_tracker/features/approveractions/screens/dashboard.dart';
import 'package:funds_tracker/features/approveractions/screens/profile.dart';
import 'package:funds_tracker/features/approveractions/screens/statistics.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:funds_tracker/utils/helpers/helper_functions.dart';

class NavigationMenuApprover extends StatelessWidget {
  const NavigationMenuApprover({super.key});

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

          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.element_4),
              selectedIcon: Icon(Iconsax.element_45),
              label: "Dashboard",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.diagram),
              selectedIcon: Icon(Iconsax.diagram),
              label: "Statistics",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.frame_1),
              selectedIcon: Icon(Iconsax.frame5),
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
    const Dashboard(),
    const Statistics(),
    const ProfileApprover(),
  ];
}
