import 'package:flutter/material.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import 'package:get/get.dart';
import '../../../utils/constants/image_strings.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../../utils/constants/sizes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../requesteractions/controllers/firestore_service.dart';

class ViewPendingRequest extends StatefulWidget {
  String requestId;
  ViewPendingRequest({super.key, required this.requestId});

  @override
  State<ViewPendingRequest> createState() => _ViewPendingRequestState();
}

class _ViewPendingRequestState extends State<ViewPendingRequest> {
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
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
              const SizedBox(
                height: 150,
              ),
              Column(
                children: [
                  AnimatedButton(
                    text: 'Approve request',
                    buttonTextStyle:
                        const TextStyle(fontSize: FSizes.fontSizeSm),
                    color: FColors.primary,
                    borderRadius: BorderRadius.circular(10),
                    pressEvent: () {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.topSlide,
                        headerAnimationLoop: false,
                        dialogType: DialogType.success,
                        showCloseIcon: true,
                        closeIcon: const Icon(Icons.cancel_outlined),
                        desc: 'Request successfully approved',
                        btnOkOnPress: () {
                          debugPrint('OnClick');
                        },
                        btnOkIcon: Icons.check_circle,
                        onDismissCallback: (type) {
                          debugPrint('Dialog Dissmiss from callback $type');
                        },
                      ).show();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AnimatedButton(
                    text: 'Reject request',
                    buttonTextStyle:
                        const TextStyle(fontSize: FSizes.fontSizeSm),
                    color: FColors.redPrimary,
                    borderRadius: BorderRadius.circular(10),
                    pressEvent: () {
                      AwesomeDialog(
                              context: context,
                              padding: const EdgeInsets.all(0),
                              dialogType: DialogType.warning,
                              headerAnimationLoop: false,
                              animType: AnimType.topSlide,
                              showCloseIcon: true,
                              closeIcon: const Icon(Icons.cancel_outlined),
                              title: 'Warning',
                              desc:
                                  'Do you really want to reject this request?',
                              btnCancelOnPress: () {},
                              onDismissCallback: (type) {
                                debugPrint(
                                    'Dialog Dismiss from callback $type');
                              },
                              btnOkOnPress: () {},
                              btnOkText: "Yes")
                          .show();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
