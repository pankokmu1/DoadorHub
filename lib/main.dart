import 'package:flutter/material.dart';
import 'package:wk_blood/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:wk_blood/main_injection.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const DashboardPage(),
    );
  }
}
