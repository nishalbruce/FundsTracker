import 'package:flutter/material.dart';
import '../../../common/components/pending_request_list_tile.dart';
import '../../../common/components/request_list_tile.dart';

class PendingRequests extends StatefulWidget {
  const PendingRequests({super.key});

  @override
  State<PendingRequests> createState() => _PendingRequestsState();
}

class _PendingRequestsState extends State<PendingRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 1,
          title: const Text(
            "Pending Request",
            style: TextStyle(
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Filter by",
                style: TextStyle(
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
                    PendingRequestListTile(),
                    PendingRequestListTile(),
                    PendingRequestListTile(),
                    PendingRequestListTile(),
                    PendingRequestListTile(),
                    PendingRequestListTile(),
                    PendingRequestListTile(),
                    PendingRequestListTile(),
                    PendingRequestListTile(),
                    PendingRequestListTile(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
