import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:funds_tracker/features/requesteractions/controllers/firestore_service.dart';
import 'package:funds_tracker/features/requesteractions/screens/history.dart';
import 'package:funds_tracker/features/requesteractions/screens/request_screen.dart';
import 'package:funds_tracker/features/requesteractions/screens/view_request.dart';
import 'package:get/get.dart';
import 'package:funds_tracker/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/components/request_list_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser!;

  var _numberToMonthMap = {
    1: "Jan",
    2: "Feb",
    3: "Mar",
    4: "Apr",
    5: "May",
    6: "Jun",
    7: "Jul",
    8: "Aug",
    9: "Sep",
    10: "Oct",
    11: "Nov",
    12: "Dec",
  };

  // Document IDs
  List<String> docIDs = [];

  // Get Document IDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('users').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Icon(Iconsax.notification_bing5),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Recent Requests",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: StreamBuilder(
                    stream: Get.put(FirestoreService()).getRequestsStream(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // final requestsList = snapshot.data!.docs;

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

                        //return ListView.builder(
                        //itemBuilder: (context, index) {
                        //Get each individual document
                        //  DocumentSnapshot document = requestsList[index];
                        //  String docId = document.id;

                        //Get request from each doc
                        //  Map<String, dynamic> data =
                        //      document.data() as Map<String, dynamic>;

                        //  Timestamp t = data['date'] as Timestamp;
                        //  DateTime date = t.toDate();
                        //String typeText = data['type'];
                        //  String requesterText = data['requester'];
                        //String amountText = data['amount'];
                        //String descriptionText = data['description'];
                        //Timestamp dateText = data['date'];
                        //String payerText = data['payer'];
                        //String statusText = data['status'];

                        //Display as a ListTile
                        //return ListTile(title: Text('${date.day}/${date.month}/${date.year}'), subtitle: Text('date'),);
                        //  return RequestListTile(
                        //    requestName: requesterText,
                        //    date: '${date.day}/${date.month}/${date.year}',
                        //    time: '${date.hour}:${date.minute}',
                        //  );
                        //});
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
              const SizedBox(
                height: 10,
              ),
              const Column(
                children: [
                  //RequestListTile(),
                  //RequestListTile(),
                  //RequestListTile(),
                ],
              ),
              TextButton(
                onPressed: () => Get.to(() => const History()),
                child: const Row(
                  children: [
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Color(0xFF40A6DD),
                        fontSize: FSizes.fontSizeSm,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Iconsax.arrow_right_1,
                        size: 12, color: Color(0xFF40A6DD))
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
                child: StreamBuilder(
                    stream: Get.put(FirestoreService()).getPendingRequests(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView(
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                            Map<String, dynamic> data =
                                document.data()! as Map<String, dynamic>;

                            Timestamp t = data['date'] as Timestamp;
                            DateTime date = t.toDate();
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
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: const Color(0xFF40A6DD),
        shape: const CircleBorder(),
        onPressed: () => Get.to(() => const Request()),
        highlightElevation: 0,
        child: const Icon(
          Iconsax.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
