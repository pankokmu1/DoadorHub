part of '../pages/dashboard_page.dart';

class ObesityStatus extends StatefulWidget {
  const ObesityStatus({
    super.key,
    required this.obesityPercentage,
  });

  final ObesityPercentage obesityPercentage;

  @override
  State<ObesityStatus> createState() => _ObesityStatusState();
}

class _ObesityStatusState extends State<ObesityStatus> {
  int touchedIndexMale = -1;
  int touchedIndexFemale = -1;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xff363740),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Percentual de Obesidade',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xfffcfeff),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Masculino',
                        style: TextStyle(
                          color: Color(0xfffcfeff),
                        ),
                      ),
                      const SizedBox(height: 10),
                      AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndexMale = -1;
                                    return;
                                  }
                                  touchedIndexMale = pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                                });
                              },
                            ),
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: _showingSections(
                              widget.obesityPercentage.male.obese,
                              widget.obesityPercentage.male.total -
                                  widget.obesityPercentage.male.obese,
                              touchedIndexMale,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Feminino',
                        style: TextStyle(
                          color: Color(0xfffcfeff),
                        ),
                      ),
                      const SizedBox(height: 10),
                      AspectRatio(
                        aspectRatio: 1,
                        child: PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndexFemale = -1;
                                    return;
                                  }
                                  touchedIndexFemale = pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                                });
                              },
                            ),
                            borderData: FlBorderData(show: false),
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: _showingSections(
                              widget.obesityPercentage.female.obese,
                              widget.obesityPercentage.female.total -
                                  widget.obesityPercentage.female.obese,
                              touchedIndexFemale,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> _showingSections(
      int obese, int nonObese, int touchedIndex) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Colors.red,
            value: obese.toDouble(),
            title: '${(obese / (obese + nonObese) * 100).toInt()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xfffcfeff),
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.green,
            value: nonObese.toDouble(),
            title: '${(nonObese / (obese + nonObese) * 100).toInt()}%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Color(0xfffcfeff),
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
