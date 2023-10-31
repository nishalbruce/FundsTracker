import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../../components/request_list_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          backgroundColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
                icon: Icon(
                  Icons.home_rounded,
                  color: Color(0xFF40A6DD),
                  size: 24,
                ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: ""
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: ""
            )
          ]),
        backgroundColor: Colors.white,
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
                          color: Colors.black,
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
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),

                const SizedBox(
                  height: 10,
                ),

                Column(
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
                              color: Colors.black
                          ),
                        ),
                        Icon(
                            Icons.arrow_forward_ios_rounded,
                          size: 12,
                          color: Colors.black,
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
                    children: [
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
      
    );
  }
}
