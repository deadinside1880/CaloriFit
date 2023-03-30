import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../styles/Colors.dart';

class BarChartWidget extends StatefulWidget {
  final List<int> weeklyCalories;
  final String wk_lst;
  final int limit;
  BarChartWidget(
      {super.key,
      required this.weeklyCalories,
      required this.wk_lst,
      required this.limit});
  @override
  State<BarChartWidget> createState() => _BarChartWidgetState();
}

class _BarChartWidgetState extends State<BarChartWidget> {
  List<BarChartGroupData> _barGroups = [];
  late int limit;

  void setData() {
    // print(widget.weeklyCalories);
    List<int> temp = [0, 0, 0, 0, 0, 0, 0];
    for (int i = 0; i < widget.weeklyCalories.length; i++) {
      temp[i] = widget.weeklyCalories[i];
    }
    setState(() {
      limit = widget.limit;

      _barGroups = temp
          .asMap()
          .entries
          .map((entry) => BarChartGroupData(x: entry.key, barRods: [
                BarChartRodData(
                    toY: entry.value.toDouble(),
                    gradient: widget.limit > entry.value.toDouble()
                        ? _barsGradient
                        : _barsGradientRed),
                // BarChartRodData(
                //     toY: entry.value.toDouble(),
                //     gradient: widget.limit > entry.value.toDouble()
                //         ? _barsGradientRed
                //         : _barsGradientRed)
              ], showingTooltipIndicators: 
                entry.value.toDouble() > 0 ? [0] : [-1]
              ))
          .toList();
    });
  }

  LinearGradient get _barsGradientRed => const LinearGradient(
        colors: [
          Color.fromRGBO(255, 120, 150, 1),
          // Colors.redAccent[900],
          Colors.red,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [
          green1,
          green3,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barRods: [
            BarChartRodData(
              toY: 8,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              toY: 14,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              toY: 15,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              toY: 13,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              toY: 10,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              toY: 20,
              gradient: _barsGradient,
            )
          ],
          showingTooltipIndicators: [0],
        ),
      ];

  BarTouchData get _barTouchData => BarTouchData(
      enabled: false,
      touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
                rod.toY.round().toString(),
                TextStyle(
                    color:
                        rod.toY.toDouble() < limit ? Colors.cyan : Colors.red,
                    fontWeight: FontWeight.bold));
          }));

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, getTitlesWidget: getTitles),
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
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.cyan,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    setData();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.run_circle_rounded,
                size: 70,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Weekly Progress",
                    style: TextStyle(
                        color: maingreen,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(widget.wk_lst)
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            const SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.width * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              child: BarChart(BarChartData(
                alignment: BarChartAlignment.spaceEvenly,
                barTouchData: _barTouchData,
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barGroups: _barGroups,
                titlesData: titlesData,
              )),
            )
          ])
        ],
      ),
    );
  }
}
