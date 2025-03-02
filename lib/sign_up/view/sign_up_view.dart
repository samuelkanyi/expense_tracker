import 'package:bloc/src/cubit.dart';
import 'package:expense_tracker/sign_up/cubit/cubit/sign_up_cubit.dart';
import 'package:expense_tracker/util/common/app_header.dart';
import 'package:expense_tracker/util/dimensions.dart';
import 'package:expense_tracker/widget/cubit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SignUpView extends CubitWidget<SignUpCubit, SignUpState> {
  @override
  Widget build(BuildContext context, Cubit cubit, state) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingL),
          child: Column(children: [
            AppHeader(),
            SizedBox(height: 20),
            const Text('Sign Up', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // cubit.signUp();
              },
              child: const Text('Sign Up'),
            ),
          ]),
        ),
      ),
    );
  }
}
