import 'package:flutter/material.dart';
import 'package:funds_tracker/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'request.dart';

import '../../common/widgets/request_list_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            elevation: 0,
            //selectedIndex: controller.selectedIndex.value,
            //onDestinationSelected: (index) => controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home),
                selectedIcon: Icon(Iconsax.home_15),
                label: "",
              ),
              NavigationDestination(
                icon: Icon(Iconsax.clock),
                selectedIcon: Icon(Icons.history),
                label: "History",
              ),
              NavigationDestination(
                icon: Icon(Iconsax.frame_1),
                selectedIcon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "👋🏻 Hello, John",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),

                    Icon(
                      Icons.notifications,
                    ),

                    //Container(
                    //  decoration: BoxDecoration(
                    //    color: Colors.grey[300],
                    //    borderRadius: BorderRadius.circular(12),
                    //  ),
                    //  padding: EdgeInsets.all(12),
                    //  child: Icon(
                    //    Icons.notifications,
                    //  ),
                    //)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Recent Requests",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),

                const SizedBox(
                  height: 10,
                ),

                const Column(
                  children: [
                    RequestListTile(),
                    RequestListTile(),
                    RequestListTile(),
                  ],
                ),

                TextButton(
                    onPressed: () {},
                    child:
                    const Row(
                      children: [
                        Text(
                          "View All",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF40A6DD),
                            fontSize: FSizes.fontSizeSm,
                          ),
                        ),
                        Icon(
                            Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Color(0xFF40A6DD)
                        )
                      ],
                    ),
                ),

                const Text(
                  "Pending Requests",
                  style: TextStyle(
                      color: Color(0xFFF29339),
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),

                const SizedBox(
                  height: 10,
                ),

                Expanded(
                  child: ListView(
                    children: const [
                      RequestListTile(),
                      RequestListTile(),
                      RequestListTile(),
                      RequestListTile(),
                      RequestListTile(),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color(0xFF40A6DD),
        shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(
              context, "/request"
          );
        },
        highlightElevation: 0,
        child: const Icon(Iconsax.edit, color: Colors.white,),
      ),
      
    );
  }
}
