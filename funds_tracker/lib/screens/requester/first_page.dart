import 'package:flutter/material.dart';
import 'package:funds_tracker/screens/requester/history.dart';
import 'package:funds_tracker/screens/requester/home.dart';
import 'package:funds_tracker/screens/requester/profile.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // This keeps track of the current screen to display
  int _selectedIndex = 0;

  // This method updates the new selected index
  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  // List of screens
  final List _screens = [
    const Home(),
    const History(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Funds Tracker")),

      body: _screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: Colors.lightBlue,
            ),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "History"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          )
        ],
      ),
    );
  }
}
