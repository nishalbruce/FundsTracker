import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


//void main() => runApp(const NavigationBarApp());

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Navigation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: <Widget>[
        Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: const Text('Page 1'),
        ),
        Container(
          color: Colors.green,
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),
      ][currentPageIndex],

      ///Bottom Navigation Bar
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(
                Icons.dashboard_rounded,
                color: Colors.white,
            ),
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          NavigationDestination(
            selectedIcon: Icon(
                Icons.bar_chart_rounded,
                color: Colors.white,
            ),
            icon: Icon(Icons.bar_chart_outlined),
            label: 'Statistics',
          ),
          NavigationDestination(
            selectedIcon: Icon(
                Icons.person,
                color: Colors.white,
            ),
            icon: Icon(Icons.person_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
