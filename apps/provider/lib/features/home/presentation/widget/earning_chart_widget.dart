import 'package:design_system/design_system.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class EarningsChart extends StatelessWidget {
  const EarningsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: UIColor.softGreen.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: UIColor.vividGreen,width: 0.4)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           UIText.bodySmall('Earned this month'),
           SizedBox(height: UI.spacing.md),
          Container(constraints: BoxConstraints(

          ),
            height: 99,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 100,
                minY: 0,
                
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = ['Feb','Mar','April','May','Jun','Jul','Aug'];
                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: UIText.bodyXXSmall( months[value.toInt()],fontFamily: UIFontFamily.almarai,)
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData( show: false),
                barGroups: _buildBarGroups(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
  final data = [
    [0,55.0],
    [1, 70.0],
    [2, 30.0],
    [3, 60.0],
    [4, 20],
    [5, 50.0],
    [6, 45.0],
  ];

  return data.map((d) {
    return BarChartGroupData(
      groupVertically: true,
      x: d[0].toInt(),
      barRods: [
        BarChartRodData(
          toY: 100,
          width: 35,
          borderRadius: BorderRadius.circular(6),
          color: UIColor.greenPaleBar,
        ),
        BarChartRodData(
          toY: d[1].toDouble(),
          width: 35,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(6),  
            topRight: Radius.circular(6),  
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          ),
          color: UIColor.successlight,
        ),
      ],
    );
  }).toList();
}

}