import 'package:flutter/material.dart';

class RequesterHome extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
          body: Row(children: [Text('Hello John'), Icon(Icons.notifications)]),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
            backgroundColor: Colors.blueAccent,
          ),
          bottomNavigationBar: NavigationBar(
            destinations: [
              NavigationDestination(
                  selectedIcon: Icon(Icons.home_rounded),
                  icon: Icon(Icons.home_rounded),
                  label: ''),
              NavigationDestination(
                  selectedIcon: Icon(Icons.history),
                  icon: Icon(Icons.history_rounded),
                  label: ''),
              NavigationDestination(
                  selectedIcon: Icon(Icons.person),
                  icon: Icon(Icons.person_outline_rounded),
                  label: ''),
            ],
            //selectedIndex: currentPageIndex,
            //onDestinationSelected: (int index){
            //  setState(() {
            //    currentPageIndex = index;
            //  });
            //},
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: Colors.white,
            animationDuration: Duration(milliseconds: 1000),
          )),
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
      this.status = 'Pending'}) {}
}