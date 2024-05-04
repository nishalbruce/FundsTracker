import 'package:flutter/material.dart';
import 'package:funds_tracker/features/requesteractions/controllers/firestore_service.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';

// ignore: must_be_immutable
class ViewRequest extends StatefulWidget {
  String requestId;
  ViewRequest({super.key, required this.requestId});

  @override
  State<ViewRequest> createState() => _ViewRequestState();
}

class _ViewRequestState extends State<ViewRequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: false,
          title: const Text(
            "Request #1",
            style: TextStyle(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: (50), // Image radius
                  backgroundImage: AssetImage(FImages.profile),
                ),
                const SizedBox(
                  height: 20,
                ),
                StreamBuilder(
                    stream: Get.put(
                        FirestoreService().getRequestDetail(widget.requestId)),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        //final data = snapshot.data?.data();
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Requester Name: "),
                                Text(snapshot.data!['requester']),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(thickness: 0.5),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Requester Type: "),
                                Text(snapshot.data!['type']),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(thickness: 0.5),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Description: "),
                                Text(snapshot.data!['description']),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(thickness: 0.5),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Amount: "),
                                Text(snapshot.data!['amount']),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(thickness: 0.5),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date: "),
                                //Text(DateFormat.yMd().format(snapshot.data!['date'])),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(thickness: 0.5),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Paid by: "),
                                Text(snapshot.data!['payer']),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(thickness: 0.5),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Status: "),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  decoration: BoxDecoration(
                                      color: FColors.orangeTertiary,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    snapshot.data!['status'],
                                    style: const TextStyle(
                                      color: FColors.orangePrimary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(thickness: 0.5),
                          ],
                        );
                      } else {
                        return const Center(
                          child: Text('nothing to show!'),
                        );
                      }
                    }),
              ],
            ),
          ),
        )
      );
  }
}
