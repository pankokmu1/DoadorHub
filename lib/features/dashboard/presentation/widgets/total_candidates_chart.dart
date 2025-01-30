part of '../pages/dashboard_page.dart';

class TotalCandidatesChart extends StatelessWidget {
  const TotalCandidatesChart({
    super.key,
    required this.totalCandidatesPerState,
  });
  final Map<States, int> totalCandidatesPerState;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Color(0xff363740),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total de doadores por estado',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xfffcfeff),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    barGroups: totalCandidatesPerState.entries
                        .map(
                          (entry) => BarChartGroupData(
                            x: entry.key.index,
                            barRods: [
                              BarChartRodData(
                                toY: entry.value.ceilToDouble(),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        )
                        .toList(),
                    gridData: FlGridData(
                      drawHorizontalLine: true,
                      drawVerticalLine: false,
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Text(
                            value.toStringAsFixed(0),
                            style: TextStyle(
                              color: Color(0xfffcfeff),
                            ),
                          ),
                          reservedSize: 30,
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) => Text(
                            States.values[value.toInt()].name,
                            style: TextStyle(
                              color: Color(0xfffcfeff),
                            ),
                          ),
                        ),
                      ),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
