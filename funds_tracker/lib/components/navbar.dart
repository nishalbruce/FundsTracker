import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

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
        const Row(
            children: [
              Text('Hello John'),
              Icon(Icons.notifications)
            ]
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

        //const Column(
        //    children: [
        //      Text('Hello John'),
        //      Icon(Icons.notifications)
        //    ]
        //),
        //Row(
        //  children: [
        //    Container(
        //      color: Colors.green,
        //      alignment: Alignment.center,
        //      child: const Text('Page 1'),
        //    ),
        //    Container(
        //      color: Colors.grey,
        //      alignment: Alignment.center,
        //      child: const Text('Page 2'),
        //    ),
        //    Container(
        //      color: Colors.blueGrey,
        //      alignment: Alignment.center,
        //      child: const Text('Page 3'),
        //    )
//
        //  ],
//
        //)
        //Container(
        //  color: Colors.blue,
        //  alignment: Alignment.center,
        //  child: const Text('Page 3'),
        //),
      ][currentPageIndex],

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),

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
              Icons.home_rounded,
              color: Colors.white,
            ),
            icon: Icon(Icons.home_outlined),
            label: "Home",
            //label: Text(
            //  "Home",
            //  style: TextStyle(
            //    fontFamily: GoogleFonts.lexend,
            //  ),
            //)
          ),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.history,
                color: Colors.white,
              ),
              icon: Icon(Icons.history_sharp),
              label: 'History'
          ),
          NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              icon: Icon(Icons.person_outline_rounded),
              label: 'Profile'
          ),
        ],
      ),
    );
  }
}

class Request {
  int id;
  String requesterName;
  String description;
  double amount;
  String payer;
  String status;

  Request(
      {this.id = 0,
        this.requesterName = 'Bruce',
        this.description = 'Transport',
        this.amount = 10000,
        this.payer = 'ACLIS',
        this.status = 'Pending'});
}

