import 'package:flutter/material.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
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
                    AnimatedButton(
                      text: 'Approve request',
                      buttonTextStyle: const TextStyle(
                          fontSize: FSizes.fontSizeSm
                      ),
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
                          desc:
                          'Request successfully approved',
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

                    const SizedBox(height: 10,),

                    AnimatedButton(
                      text: 'Reject request',
                      buttonTextStyle: const TextStyle(
                        fontSize: FSizes.fontSizeSm
                      ),
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
                          desc: 'Do you really want to reject this request?',
                          btnCancelOnPress: () {},
                          onDismissCallback: (type) {
                            debugPrint('Dialog Dismiss from callback $type');
                          },
                          btnOkOnPress: () {},
                          btnOkText: "Yes"
                        ).show();
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
