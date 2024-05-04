import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  Stream<QuerySnapshot> getRequest() {
    return FirebaseFirestore.instance.collection("requests").snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            "Statistics",
            style: TextStyle(),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  const Text("Ranks by Request type"),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: 250,
                      height: 250,
                      child: StreamBuilder(
                          stream: getRequest(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return const Text('Something went wrong');
                            } else {
                              List<QueryDocumentSnapshot> documents =
                                  snapshot.data!.docs;
                              int airTimeCount = 0;
                              int transportCount = 0;
                              int dishesCount = 0;
                              int waterCount = 0;

                              documents.forEach((doc) {
                                String requestType = doc['type'];
                                if (requestType == 'Airtime') {
                                  airTimeCount++;
                                } else if (requestType == 'Transport') {
                                  transportCount++;
                                } else if (requestType == 'Dishes') {
                                  dishesCount++;
                                } else if (requestType == 'Water') {
                                  waterCount++;
                                }
                              });

                              return PieChart(
                                PieChartData(
                                    borderData: FlBorderData(show: false),
                                    //centerSpaceRadius: 0,
                                    sectionsSpace: 2,
                                    sections: [
                                      PieChartSectionData(
                                          value: transportCount.toDouble(),
                                          color: Colors.grey,
                                          title: "Transport",
                                          radius: 60),
                                      PieChartSectionData(
                                          value: dishesCount.toDouble(),
                                          color: Colors.blueAccent,
                                          title: "Dishes",
                                          radius: 70),
                                      PieChartSectionData(
                                          value: airTimeCount.toDouble(),
                                          color: Colors.red,
                                          title: "Airtime",
                                          radius: 80),
                                      PieChartSectionData(
                                          value: waterCount.toDouble(),
                                          color: Colors.orange,
                                          title: "Water",
                                          radius: 100),
                                    ]),
                              );
                            }
                          })),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Monthly based statistics"),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 250,
                      child: BarChart(BarChartData(
                        maxY: 100,
                        minY: 0,
                      ))),
                ],
              ),
            ),
          ),
        ));
  }
}
