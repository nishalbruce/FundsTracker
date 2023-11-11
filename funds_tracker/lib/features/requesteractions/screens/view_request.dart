import 'package:flutter/material.dart';
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
          title: const Text(
            "Request #1",
            style: TextStyle(),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
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
                )
              ],
            ),
          ),
        ));
  }
}
