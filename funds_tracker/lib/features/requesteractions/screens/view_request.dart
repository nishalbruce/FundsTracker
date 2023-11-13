import 'package:flutter/material.dart';
import 'package:funds_tracker/utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';

class ViewRequest extends StatefulWidget {
  const ViewRequest({super.key});

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
                Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Requester Name: "),
                        Text("Alain Bruce"),
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
                        Text("Requester Type: "),
                        Text("Transport"),
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
                        Text("Description: "),
                        Text("Lorem ipsum"),
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
                        Text("Amount: "),
                        Text("30.000"),
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
                        Text("20/12/2023"),
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
                        Text("Paid by: "),
                        Text("ACLIS"),
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
                          padding: const EdgeInsets.fromLTRB(20,10,20,10),
                          decoration: BoxDecoration(
                            color: FColors.orangeTertiary,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: const Text(
                            "Pending",
                            style: TextStyle(
                            color: FColors.orangePrimary,
                          ),),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(thickness: 0.5),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
