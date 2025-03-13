import 'package:expense_tracker/sign_up/cubit/cubit/sign_up_cubit.dart';
import 'package:expense_tracker/sign_up/cubit/cubit/sign_up_state.dart';
import 'package:expense_tracker/util/asset_file.dart';
import 'package:expense_tracker/util/colors.dart';
import 'package:expense_tracker/util/common/app_header.dart';
import 'package:expense_tracker/util/common/base_button.dart';
import 'package:expense_tracker/util/common/custom_input.dart';
import 'package:expense_tracker/util/dimensions.dart';
import 'package:expense_tracker/widget/cubit_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpView extends CubitWidget<SignUpCubit, SignUpState> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context, SignUpCubit cubit, SignUpState state) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingL),
          child: Column(
            spacing: Dimensions.paddingM,
            children: [
              const AppHeader(
                label: 'Sign Up',
              ),
              const SizedBox(height: Dimensions.custom56),
              CustomInput(
                controller: TextEditingController(),
                onChanged: (String txt) {},
                labelText: 'Name',
              ),
              CustomInput(
                controller: TextEditingController(),
                onChanged: (String txt) {},
                hintText: 'Email',
                labelText: 'Email',
              ),
              CustomInput(
                controller: TextEditingController(),
                onChanged: (String txt) {},
                hintText: 'Password',
                labelText: 'Password',
                isPassword: true,
                hasSuffixIcon: true,
              ),
              //terms and agreement
              Row(
                children: [
                  Checkbox(value: false, onChanged: (bool? value) {}),
                  const Text('I agree to the terms and conditions'),
                ],
              ),
              PrimaryButton(
                onPressed: () {},
                label: 'Sign Up',
                width: double.infinity,
              ),
              Text(
                'Or with',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: AppColors.baseLight20,
                    ),
              ),
              TextButton.icon(
                onPressed: () {},
                label: Text(
                  'Sign up with Google',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                icon: SvgPicture.asset(
                  AssetFile.googleIcon,
                ),
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.custom10),
                  ),
                  side: const BorderSide(color: AppColors.baseLight20),
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
              //already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
