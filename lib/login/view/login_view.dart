import 'package:expense_tracker/app/routing/app_navigator.dart';
import 'package:expense_tracker/login/cubit/cubit/login_cubit.dart';
import 'package:expense_tracker/util/colors.dart';
import 'package:expense_tracker/util/common/base_button.dart';
import 'package:expense_tracker/util/common/custom_input.dart';
import 'package:expense_tracker/widget/cubit_widget.dart';
import 'package:flutter/material.dart';

class LoginView extends CubitWidget<LoginCubit, LoginState> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, LoginCubit cubit, LoginState state) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              // Email Field
              const CustomTextField(
                label: 'Email',
                hintText: 'Email',
                icon: Icons.email_outlined,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextField(
                label: 'Password',
                hintText: '••••••••',
                icon: Icons.lock_outline,
                obscureText: true,
              ),

              const SizedBox(height: 24),
              // Login Button
              PrimaryButton(
                onPressed: () => context.navigateToHome(),
                label: 'Login',
              ),
              const SizedBox(height: 24),
              // Forgot Password
              Center(
                child: TextButton(
                  onPressed: () {
                    // Handle forgot password
                  },
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account yet? ',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () => context.navigateToSignUp(),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              // Bottom spacer (home indicator area)
              const Spacer(),
              Container(
                height: 5,
                width: 134,
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2.5),
                ),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
