import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:funds_tracker/features/requesteractions/screens/view_request.dart';
import 'package:get/get.dart';

class RequestListTile extends StatelessWidget {
  String reqId;
  String requestName;
  String date;
  String time;

  RequestListTile(
      {super.key,
      required this.reqId,
      required this.requestName,
      required this.date,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: GestureDetector(
            onTap: () => Get.to(() => ViewRequest(requestId: reqId,)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5)),
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      requestName,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),

                    //SizedBox(
                    //  height: 5,
                    //),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          date,
                          style: const TextStyle(fontSize: 13.3),
                        ),
                        Text(
                          time,
                          style: const TextStyle(fontSize: 13.3),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
