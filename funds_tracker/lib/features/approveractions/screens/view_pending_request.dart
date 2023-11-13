import 'package:flutter/material.dart';
import 'package:funds_tracker/features/approveractions/screens/dashboard.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import 'package:get/get.dart';

import '../../../utils/constants/sizes.dart';

class ViewPendingRequest extends StatefulWidget {
  const ViewPendingRequest({super.key});

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
                const Column(
                  children: [
                    CircleAvatar(
                      radius: (50), // Image radius
                      backgroundImage: AssetImage(FImages.profile),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Requester Name: "),
                            Text("Alain Bruce"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(thickness: 0.5),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Requester Type: "),
                            Text("Transport"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(thickness: 0.5),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Description: "),
                            Text("Lorem ipsum"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(thickness: 0.5),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Amount: "),
                            Text("30.000"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(thickness: 0.5),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Date: "),
                            Text("20/12/2023"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(thickness: 0.5),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Paid by: "),
                            Text("ACLIS"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(thickness: 0.5),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Status: "),
                            Text("Pending"),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(thickness: 0.5),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 150,),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const Dashboard()),
                        child: const Text("Approve Request"),
                      ),
                    ),
                    const SizedBox(
                        height: FSizes.spaceBtwItems
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Get.to(() => const Dashboard()),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(FColors.redPrimary)
                        ),
                        child: const Text("Reject Request"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
