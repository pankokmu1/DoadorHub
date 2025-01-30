import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:wk_blood/core/widgets/custom_drawer.dart';
import 'package:wk_blood/features/candidate/presentation/pages/upload_candidates_page.dart';
import 'package:wk_blood/features/dashboard/domain/enums/states.dart';
import 'package:wk_blood/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:collection/collection.dart';
import 'package:wk_blood/main_injection.dart';

import '../../domain/entities/dashboard.dart';

part '../widgets/blood_type_data_widget.dart';
part '../widgets/imc_chart.dart';
part '../widgets/obesity_status_widget.dart';
part '../widgets/total_candidates_chart.dart';
part '../widgets/total_donors_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late DashboardCubit cubit;
  @override
  void initState() {
    cubit = di<DashboardCubit>()..fetchDashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        dashboardSelected: true,
      ),
      backgroundColor: Color(0xff242529),
      appBar: AppBar(
        backgroundColor: Color(0xff242529),
        title: const Text(
          'Dashboard',
          style: TextStyle(color: Color(0xfffcfeff)),
        ),
        elevation: 0.0,
      ),
      body: BlocConsumer<DashboardCubit, DashboardState>(
        bloc: cubit,
        listenWhen: (previous, current) => current is DashboardWarning,
        listener: (context, state) {
          if (state is DashboardWarning) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is DashboardLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is DashboardError) {
            return Center(child: Text(state.message));
          } else if (state is DashboardLoaded) {
            final dashboard = state.dashboard;

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth >= 1200) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: TotalDonors(
                                      donorsPerBloodType:
                                          dashboard.donorsPerBloodType)),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: ObesityStatus(
                                      obesityPercentage:
                                          dashboard.obesityPercentage)),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: BloodTypeData(
                                      donorsPerBloodType:
                                          dashboard.donorsPerBloodType)),
                            ],
                          ),
                          const SizedBox(height: 40),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: TotalCandidatesChart(
                                      totalCandidatesPerState:
                                          dashboard.totalCandidatesPerState)),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: ImcChart(
                                      imcByAgeRange: dashboard.imcByAgeRange)),
                            ],
                          ),
                        ],
                      );
                    } else if (constraints.maxWidth >= 600) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: TotalDonors(
                                      donorsPerBloodType:
                                          dashboard.donorsPerBloodType)),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: ObesityStatus(
                                      obesityPercentage:
                                          dashboard.obesityPercentage)),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: BloodTypeData(
                                      donorsPerBloodType:
                                          dashboard.donorsPerBloodType)),
                              const SizedBox(width: 20),
                              Expanded(
                                  child: TotalCandidatesChart(
                                      totalCandidatesPerState:
                                          dashboard.totalCandidatesPerState)),
                            ],
                          ),
                          const SizedBox(height: 20),
                          ImcChart(imcByAgeRange: dashboard.imcByAgeRange),
                        ],
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TotalDonors(
                              donorsPerBloodType: dashboard.donorsPerBloodType),
                          const SizedBox(height: 20),
                          ObesityStatus(
                              obesityPercentage: dashboard.obesityPercentage),
                          const SizedBox(height: 20),
                          BloodTypeData(
                              donorsPerBloodType: dashboard.donorsPerBloodType),
                          const SizedBox(height: 20),
                          TotalCandidatesChart(
                              totalCandidatesPerState:
                                  dashboard.totalCandidatesPerState),
                          const SizedBox(height: 20),
                          ImcChart(imcByAgeRange: dashboard.imcByAgeRange),
                        ],
                      );
                    }
                  },
                ),
              ),
            );
          }
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(24),
                  child: SizedBox(
                    height: 400,
                    child: RiveAnimation.asset(
                      'assets/images/upload.riv',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const UploadCandidatesPage(),
                      ),
                    );
                  },
                  child: Text('fazer upload dos dados'),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
