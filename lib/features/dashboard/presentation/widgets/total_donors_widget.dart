part of '../pages/dashboard_page.dart';

class TotalDonors extends StatelessWidget {
  const TotalDonors({
    super.key,
    required this.donorsPerBloodType,
  });

  final List<DonorsPerBloodType> donorsPerBloodType;

  @override
  Widget build(BuildContext context) {
    final donorsLenght =
        donorsPerBloodType.fold(0, (sum, item) => sum + item.count);
    return Card(
      color: Color(0xffa7abff),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Total de doadores',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff000018),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                height: 200,
                child: RiveAnimation.asset(
                  'assets/images/heart.riv',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Text(
              '$donorsLenght Pessoas',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xff000018),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
