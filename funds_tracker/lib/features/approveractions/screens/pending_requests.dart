import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/components/pending_request_list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../common/components/request_list_tile.dart';
import '../../requesteractions/controllers/firestore_service.dart';

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
            style: TextStyle(),
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
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
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
                  children: const [],
                ),
              ),
              Expanded(
                child: StreamBuilder(
                    stream: Get.put(FirestoreService()).getRequestsStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;

                            Timestamp t = data['date'] as Timestamp;
                            DateTime date = t.toDate();

                            //return const ListTile(title: Text('data[day]/data[month]/data[year]'), subtitle: Text('date'),);
                            return RequestListTile(
                              reqId: document.id,
                              requestName: data['requester'],
                              date: '${date.day}/${date.month}/${date.year}',
                              time: '${date.hour}:${date.minute}',
                            );
                          }).toList(),
                        );
                      } else if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Center(
                            child: Text("Something went wrong"));
                      } else {
                        return const Center(
                            child: Text("No request to display"));
                      }
                    }),
              ),
            ],
          ),
        ));
  }
}
