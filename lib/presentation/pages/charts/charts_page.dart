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
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: Styles.shadows,
            ),
            child: Column(
              children: [
                const Text(
                  'Количество патентов в год',
                  style: Styles.bold,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 225,
                  child: LineChart(
                    LineChartData(lineBarsData: [
                      LineChartBarData(
                        barWidth: 2,
                        color: Styles.accent,
                        isCurved: true,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: true),
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
              ],
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: Styles.shadows,
            ),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: '',
                    children: [
                      const TextSpan(
                        text: 'Всего затронуто: ',
                        style: Styles.bold,
                      ),
                      TextSpan(
                        text: '5',
                        style: Styles.bold.copyWith(color: Styles.accent),
                      ),
                      const TextSpan(
                        text: ' разделов',
                        style: Styles.normal,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 375,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(value: 54, color: Colors.blue),
                        PieChartSectionData(value: 21, color: Colors.red),
                        PieChartSectionData(value: 58, color: Colors.yellow),
                        PieChartSectionData(value: 98, color: Colors.green),
                        PieChartSectionData(value: 12, color: Colors.orange),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
