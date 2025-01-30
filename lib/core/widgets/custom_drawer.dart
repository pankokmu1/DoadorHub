import 'package:flutter/material.dart';
import 'package:wk_blood/features/candidate/presentation/pages/upload_candidates_page.dart';
import 'package:wk_blood/features/dashboard/presentation/pages/dashboard_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer(
      {super.key, this.dashboardSelected = false, this.uploadSelected = false})
      : assert(uploadSelected != dashboardSelected);
  final bool dashboardSelected;
  final bool uploadSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xff242529),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xff242529),
              ),
              child: Row(
                children: [
                  Icon(Icons.bubble_chart, color: Colors.white, size: 28),
                  SizedBox(width: 10),
                  Text(
                    "DoadorHub",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _DrawerItem(
              icon: Icons.dashboard_rounded,
              label: "Inicio",
              selected: dashboardSelected,
              onTap: uploadSelected
                  ? () => Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const DashboardPage(),
                        ),
                      )
                  : () {},
            ),
            _DrawerItem(
              icon: Icons.upload_file_rounded,
              label: "Submeter",
              selected: uploadSelected,
              onTap: dashboardSelected
                  ? () => Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const UploadCandidatesPage(),
                        ),
                      )
                  : () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
      child: DecoratedBox(
        decoration: selected
            ? BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              )
            : BoxDecoration(),
        child: ListTile(
          leading: Icon(icon, color: Colors.white),
          title: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
