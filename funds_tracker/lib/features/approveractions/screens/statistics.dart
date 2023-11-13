import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            "Statistics",
            style: TextStyle(
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 3,
                        sections: [
                          PieChartSectionData(value: 35, color: Colors.grey, title: "Transport", radius: 75),
                          PieChartSectionData(value: 40, color: Colors.blueAccent, title: "Dishes", radius: 40),
                          PieChartSectionData(value: 55, color: Colors.red, title: "Airtime", radius: 55),
                          PieChartSectionData(value: 70, color: Colors.orange, title: "Snacks", radius: 70),
                        ]
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 250,
                    height: 250,
                    child: PieChart(
                      PieChartData(
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 3,
                          sections: [
                            PieChartSectionData(value: 35, color: Colors.grey, title: "Transport", radius: 75),
                            PieChartSectionData(value: 40, color: Colors.blueAccent, title: "Dishes", radius: 40),
                            PieChartSectionData(value: 55, color: Colors.red, title: "Airtime", radius: 55),
                            PieChartSectionData(value: 70, color: Colors.orange, title: "Snacks", radius: 70),
                          ]
                      ),
                    ),
                  ),

                  SizedBox(
                    width: 250,
                    height: 250,
                    child: PieChart(
                      PieChartData(
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 3,
                          sections: [
                            PieChartSectionData(value: 35, color: Colors.grey, title: "Transport", radius: 75),
                            PieChartSectionData(value: 40, color: Colors.blueAccent, title: "Dishes", radius: 40),
                            PieChartSectionData(value: 55, color: Colors.red, title: "Airtime", radius: 55),
                            PieChartSectionData(value: 70, color: Colors.orange, title: "Snacks", radius: 70),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

