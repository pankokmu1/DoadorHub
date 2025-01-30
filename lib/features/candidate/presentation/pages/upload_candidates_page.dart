import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:wk_blood/core/widgets/custom_drawer.dart';

import 'package:wk_blood/features/candidate/presentation/cubit/candidate_cubit.dart';
import 'package:wk_blood/main_injection.dart';

class UploadCandidatesPage extends StatefulWidget {
  const UploadCandidatesPage({super.key});

  @override
  State<UploadCandidatesPage> createState() => _UploadCandidatesPageState();
}

class _UploadCandidatesPageState extends State<UploadCandidatesPage> {
  late final CandidateCubit candidateCubit;
  @override
  void initState() {
    candidateCubit = di<CandidateCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        uploadSelected: true,
      ),
      backgroundColor: Color(0xff242529),
      appBar: AppBar(
        backgroundColor: Color(0xff242529),
        title: const Text(
          'Upload',
          style: TextStyle(color: Color(0xfffcfeff)),
        ),
        elevation: 0.0,
      ),
      body: Center(
        child: BlocConsumer<CandidateCubit, CandidateState>(
          bloc: candidateCubit,
          listener: (context, state) {
            if (state is CandidateError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
            if (state is CandidateSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content:
                      Text('Parabens, seus dados foram salvos com sucesso'),
                ),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: SizedBox(
                height: 500,
                width: 500,
                child: Card(
                  color: Color(0xff363740),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
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
                          onPressed: state is CandidateLoading
                              ? null
                              : candidateCubit.upload,
                          child: Text('Selecionar dados'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
