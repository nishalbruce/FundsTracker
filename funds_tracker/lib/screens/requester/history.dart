import 'package:flutter/material.dart';
import '../../common/widgets/request_list_tile.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 1,
          title: const Text(
            "History",
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "All Requests",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Filter by",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 10,
              ),
              //DropdownButton(
              //    items: items,
              //    onChanged: onChanged,
              //),
              Expanded(
                child: ListView(
                  children: const [
                    RequestListTile(),
                    RequestListTile(),
                    RequestListTile(),
                    RequestListTile(),
                    RequestListTile(),
                    RequestListTile(),
                    RequestListTile(),
                    RequestListTile(),
                    RequestListTile(),
                    RequestListTile(),
                    RequestListTile(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
