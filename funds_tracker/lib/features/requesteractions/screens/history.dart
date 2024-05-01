import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:funds_tracker/features/requesteractions/controllers/firestore_service.dart';
import 'package:get/get.dart';
import '../../../common/components/request_list_tile.dart';

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
          automaticallyImplyLeading: false,
          elevation: 1,
          title: const Text(
            "History",
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
              const Text(
                "All Requests",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
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
                child: StreamBuilder<QuerySnapshot>(
                    stream: Get.put(FirestoreService()).getRequestsStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List requestsList = snapshot.data!.docs;

                        return ListView.builder(
                            itemCount: requestsList.length,
                            itemBuilder: (context, index) {
                              //Get each individual document
                              DocumentSnapshot document = requestsList[index];
                              String docId = document.id;

                              //Get request from each doc
                              Map<String, dynamic> data =
                                  document.data() as Map<String, dynamic>;

                              Timestamp t = data['date'] as Timestamp;
                              DateTime date = t.toDate();
                              //String typeText = data['type'];
                              String requesterText = data['requester'];
                              //String amountText = data['amount'];
                              //String descriptionText = data['description'];
                              //Timestamp dateText = data['date'];
                              //String payerText = data['payer'];
                              //String statusText = data['status'];

                              //Display as a ListTile
                              //return ListTile(title: Text('${date.day}/${date.month}/${date.year}'), subtitle: Text('date'),);
                              return RequestListTile(
                                reqId: document.id,
                                requestName: requesterText,
                                date: '${date.day}/${date.month}/${date.year}',
                                time: '${date.hour}:${date.minute}',
                              );
                            });
                      } else {
                        return const Text("No request to display");
                      }
                    }),
              )
            ],
          ),
        ));
  }
}
