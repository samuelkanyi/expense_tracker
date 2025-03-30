import 'package:expense_tracker/guide_screens/cubit/app_guide_cubit.dart';
import 'package:expense_tracker/guide_screens/view/app_guide_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppGuidePage extends StatelessWidget {
  const AppGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PageCubit(),
      child: const AppGuideView(),
    );
  }
}
