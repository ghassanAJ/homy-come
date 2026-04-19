import 'package:design_system/design_system.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:homy_provider/localization/files/providerTr.i69n.dart';
import 'package:util/util.dart';

class EarningsChart extends StatelessWidget {
  EarningsChart({super.key});
  var months = ['Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
  @override
  Widget build(BuildContext context) {
    final tr = context.loc<ProviderTr>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UI.spacing.lg),
      child: Container(
        padding: EdgeInsets.all(UI.spacing.md),
        decoration: BoxDecoration(
          color: UIColor.softGreen.withAlpha(50),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: UIColor.vividGreen, width: 0.4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UIText.bodySmall(tr.title.earnedMonth),
            SizedBox(height: UI.spacing.md),
            Container(
              constraints: BoxConstraints(),
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
                          return Padding(
                            padding: EdgeInsets.only(top: UI.spacing.xs),
                            child: UIText.bodyXXSmall(
                              months[value.toInt()],
                              fontFamily: UIFontFamily.almarai,
                            ),
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
                  borderData: FlBorderData(show: false),
                  barGroups: _buildBarGroups([
                    [0, 55],
                    [1, 70],
                    [2, 30],
                    [3, 60],
                    [4, 20],
                    [5, 50],
                    [6, 45],
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups(List data) {
    return data.map((d) {
      return BarChartGroupData(
        groupVertically: true,
        x: d[0].toInt(),
        barRods: [
          BarChartRodData(
            toY: 100,
            width: UI.spacing.xl,
            borderRadius: BorderRadius.circular(6),
            color: UIColor.greenPaleBar,
          ),
          BarChartRodData(
            toY: d[1].toDouble(),
            width: UI.spacing.xl,
            borderRadius: BorderRadius.circular(6),
            color: UIColor.successlight,
          ),
        ],
      );
    }).toList();
  }
}
