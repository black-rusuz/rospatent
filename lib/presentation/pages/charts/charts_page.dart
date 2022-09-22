import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../providers/style.dart';

class ChartsPage extends StatelessWidget {
  final String pattern;

  const ChartsPage({super.key, required this.pattern});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(true),
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Запрос $pattern', style: Styles.bold),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        children: [
          SizedBox(
            height: 225,
            child: LineChart(
              LineChartData(lineBarsData: [
                LineChartBarData(
                  isCurved: true,
                  color: const Color(0xff4af699),
                  barWidth: 8,
                  isStrokeCapRound: true,
                  dotData: FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                  spots: const [
                    FlSpot(1, 1),
                    FlSpot(3, 1.5),
                    FlSpot(5, 1.4),
                    FlSpot(7, 3.4),
                    FlSpot(10, 2),
                    FlSpot(12, 2.2),
                    FlSpot(13, 1.8),
                  ],
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 375,
            child: PieChart(
              PieChartData(sections: [
                PieChartSectionData(value: 80),
                PieChartSectionData(value: 20),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
