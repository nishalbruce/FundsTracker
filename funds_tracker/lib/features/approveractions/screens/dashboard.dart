import 'package:flutter/material.dart';
import 'package:funds_tracker/features/approveractions/screens/approved_requests.dart';
import 'package:funds_tracker/features/approveractions/screens/pending_requests.dart';
import 'package:funds_tracker/features/approveractions/screens/rejected_requests.dart';
import 'package:funds_tracker/features/requesteractions/controllers/firestore_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../common/components/request_list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Stream<QuerySnapshot> getRequest() {
    return FirebaseFirestore.instance.collection("requests").snapshots();
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
                    "Dashboard",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),

                  Icon(
                    Iconsax.notification_bing5,
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
              //StreamBuilder(
              //    stream: getRequest(),
              //    builder: (context, snapshot) {
              //      if (!snapshot.hasData) {
              //        return const Center(child: CircularProgressIndicator());
              //      }else if(snapshot.hasError){
              //        return const Center(child: Text('Something went wrong'));
              //      }else if(snapshot.hasData){
              //        
              //      }
              //      else{}
              //    }),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Get.to(() => const PendingRequests()),
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
                        onTap: () => Get.to(() => const ApprovedRequests()),
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
                  GestureDetector(
                    onTap: () => Get.to(() => const RejectedRequests()),
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
        ),
      ),
    );
  }
}
