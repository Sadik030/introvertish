import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:time_chart/time_chart.dart';

class TimeSpent extends StatelessWidget {
  TimeSpent({super.key});
  final data = [
    DateTimeRange(
      start: DateTime(2021, 2, 24, 23, 15),
      end: DateTime(2021, 2, 25, 7, 30),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 22, 1, 55),
      end: DateTime(2021, 2, 22, 9, 12),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 20, 0, 25),
      end: DateTime(2021, 2, 20, 7, 34),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 17, 21, 23),
      end: DateTime(2021, 2, 18, 4, 52),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 13, 6, 32),
      end: DateTime(2021, 2, 13, 13, 12),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 1, 9, 32),
      end: DateTime(2021, 2, 1, 15, 22),
    ),
    DateTimeRange(
      start: DateTime(2021, 1, 22, 12, 10),
      end: DateTime(2021, 1, 22, 16, 20),
    ),
  ];
  final sizedBox = const SizedBox(height: 16);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        //Icon(Icons.arrow_back),
        title: Text(
          "Time Spent",
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Time Spent on App"),
            sizedBox,
            Expanded(
              child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        tabs: [
                          Tab(text: 'Yearly'),
                          Tab(text: 'Monthly'),
                          Tab(text: 'Weekly'),
                        ],
                      ),
                      Text(
                        "3 hours",
                        style: TextStyle(
                            fontSize: 24,
                            color: const Color.fromARGB(255, 10, 180, 16)),
                      ),
                      Text("Daily Average"),
                      sizedBox,
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Content for Tab 1
                            TimeChart(
                              data: data,
                              chartType: ChartType.amount,
                              viewMode: ViewMode.weekly,
                              barColor: Colors.deepPurple,
                            ),

                            // Content for Tab 2
                            TimeChart(
                              data: data,
                              chartType: ChartType.amount,
                              viewMode: ViewMode.weekly,
                              barColor: Colors.deepPurple,
                            ),

                            // Content for Tab 3
                            TimeChart(
                              data: data,
                              chartType: ChartType.amount,
                              viewMode: ViewMode.weekly,
                              barColor: Colors.deepPurple,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
