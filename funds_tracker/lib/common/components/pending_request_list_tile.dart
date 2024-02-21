import 'package:flutter/material.dart';
import 'package:funds_tracker/features/approveractions/screens/view_pending_request.dart';
import 'package:get/get.dart';

class PendingRequestListTile extends StatefulWidget {
  //final requestName;
  //final date;
  //final time;
//
  const PendingRequestListTile({
    super.key,
    //required this.requestName,
    //required this.date,
    //required this.time
  });

  @override
  State<PendingRequestListTile> createState() => _PendingRequestListTileState();
}

class _PendingRequestListTileState extends State<PendingRequestListTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0),
          child: GestureDetector(
            onTap: ()=> Get.to(() => const ViewPendingRequest()),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(5)
              ),
              height: 57,
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Request #1",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                      ),
                    ),

                    //SizedBox(
                    //  height: 5,
                    //),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            "12/10/2023",
                          style: TextStyle(
                            fontSize: 13.3
                          ),
                        ),
                        Text(
                          "02:30 PM",
                          style: TextStyle(
                              fontSize: 13.3
                          ),
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
