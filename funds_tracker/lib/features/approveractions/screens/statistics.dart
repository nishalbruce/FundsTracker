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
                  const Text("Ranks by Request type"),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 250,
                    height: 250,
                    child: PieChart(
                      PieChartData(
                        borderData: FlBorderData(show: false),
                        //centerSpaceRadius: 0,
                        sectionsSpace: 2,
                        sections: [
                          PieChartSectionData(value: 35, color: Colors.grey, title: "Transport", radius: 60),
                          PieChartSectionData(value: 40, color: Colors.blueAccent, title: "Dishes", radius:70),
                          PieChartSectionData(value: 55, color: Colors.red, title: "Airtime", radius: 80),
                          PieChartSectionData(value: 70, color: Colors.orange, title: "Snacks", radius: 100),
                        ]
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Monthly based statistics"),
                  const SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    height: 250,
                    child: BarChart(
                      BarChartData(
                        maxY: 100,
                        minY: 0,
                      )
                    )
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}

