part of '../pages/dashboard_page.dart';

class BloodTypeData extends StatelessWidget {
  const BloodTypeData({
    super.key,
    required this.donorsPerBloodType,
  });

  final List<DonorsPerBloodType> donorsPerBloodType;

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
              'Doadores por Tipo Sanguíneo',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xfffcfeff),
              ),
            ),
            ...donorsPerBloodType.map((data) => ListTile(
                  title: Text(
                    data.bloodType.name,
                    style: TextStyle(
                      color: Color(0xfffcfeff),
                    ),
                  ),
                  trailing: Text(
                    '${data.count.toInt()} doadores',
                    style: TextStyle(
                      color: Color(0xfffcfeff),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
