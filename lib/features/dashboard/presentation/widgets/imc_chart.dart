part of '../pages/dashboard_page.dart';

class ImcChart extends StatelessWidget {
  const ImcChart({
    super.key,
    required this.imcByAgeRange,
  });
  final List<ImcByAgeRange> imcByAgeRange;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff363740),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'IMC Médio por Faixa Etária',
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
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: imcByAgeRange
                            .map((data) => [
                                  FlSpot(
                                    data.range.minAge.toDouble() -
                                        (data != imcByAgeRange.first ? 1 : 0),
                                    data.averageImc,
                                  ),
                                  FlSpot(
                                    data.range.maxAge.toDouble(),
                                    data.averageImc,
                                  ),
                                ])
                            .expand((element) => element)
                            .sorted((e1, e2) => e1.x > e2.x ? 1 : -1)
                            .toList(),
                        isCurved: false,
                        color: Colors.red,
                        barWidth: 2,
                        isStrokeCapRound: false,
                        dotData: FlDotData(show: false),
                      ),
                    ],
                    baselineX: 30.0,
                    baselineY: 30.0,
                    gridData: FlGridData(
                      drawHorizontalLine: true,
                      drawVerticalLine: false,
                      verticalInterval: 5,
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 25,
                          getTitlesWidget: (value, meta) => Text(
                            value.toStringAsFixed(0),
                            style: TextStyle(
                              color: Color(0xfffcfeff),
                            ),
                          ),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 55,
                          getTitlesWidget: (value, meta) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              value.toString(),
                              style: TextStyle(
                                color: Color(0xfffcfeff),
                              ),
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
