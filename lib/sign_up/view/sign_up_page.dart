import 'package:expense_tracker/login_guide/cubit/login_guide_cubit.dart';
import 'package:expense_tracker/login_guide/view/login_guide_view.dart';
import 'package:expense_tracker/sign_up/cubit/cubit/sign_up_cubit.dart';
import 'package:expense_tracker/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: SignUpView(),
    );
  }
}
