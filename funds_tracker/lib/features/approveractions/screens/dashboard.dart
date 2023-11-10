import 'package:flutter/material.dart';
//import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/widgets/request_list_tile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                Icons.dashboard_rounded,
                color: Color(0xFF40A6DD),
                size: 24,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart_rounded),
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
                    "Dashboard",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      width: 165,
                      decoration: BoxDecoration(
                        color: const Color(0x2BFFA012),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.fromLTRB(17, 17, 17, 10),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pending Requests",
                            style: TextStyle(
                                color: Color(0xFFFFA012),
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),

                          Text(
                            "10",
                            style: TextStyle(
                                color: Color(0x73FFA012),
                                fontSize: 64,
                                fontWeight: FontWeight.w900),

                          ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0x2B17D72A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 165,
                      padding: const EdgeInsets.fromLTRB(17, 17, 17, 10),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Approved Requests",
                            style: TextStyle(
                                color: Color(0xFF17D72A),
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),

                          Text(
                            "10",
                            style: TextStyle(
                                color: Color(0x7317D72A),
                                fontSize: 64,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 22.5,
              ),

              Column(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0x2BE9190C),
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.all(17),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rejected Requests",
                            style: TextStyle(
                                color: Color(0xFFE9190C),
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),

                          Text(
                            "10",
                            style: TextStyle(
                                color: Color(0x73E9190C),
                                fontSize: 64,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              const Text(
                "New Requests",
                style: TextStyle(
                    color: Colors.black,
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

    );
  }
}

