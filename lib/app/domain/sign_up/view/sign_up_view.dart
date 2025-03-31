import 'package:expense_tracker/app/routing/app_navigator.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/app/domain/sign_up/cubit/cubit/sign_up_cubit.dart';
import 'package:expense_tracker/app/domain/sign_up/cubit/cubit/sign_up_state.dart';
import 'package:expense_tracker/util/common/base_button.dart';
import 'package:expense_tracker/util/common/custom_input.dart';
import 'package:expense_tracker/util/common/social_icons.dart';
import 'package:expense_tracker/widget/cubit_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpView extends CubitWidget<SignUpCubit, SignUpState> {
  SignUpView({super.key});
  bool _acceptTerms = false;
  @override
  Widget build(
      BuildContext context, SignUpCubit signUpCubit, SignUpState signUpState) {
    final S = context.l10n;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(height: 40),
                ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    S.signup,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  S.create_account,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 40),

                // Form Fields
                CustomTextField(
                  label: S.fullname,
                  hintText: S.fullname_hint,
                  icon: Icons.person_outline,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: S.email,
                  hintText: S.email_hint,
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: S.password,
                  hintText: '••••••••',
                  icon: Icons.lock_outline,
                  obscureText: true,
                ),
                const SizedBox(height: 24),

                // Terms Checkbox
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: _acceptTerms
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: _acceptTerms
                            ? const Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.white,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(text: S.i_agree_terms_1),
                            TextSpan(
                              text: S.i_agree_terms_2,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(text: S.i_agree_terms_3),
                            TextSpan(
                              text: S.i_agree_terms_4,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Sign Up Button
                PrimaryButton(
                  onPressed: () {
                    context.navigateToHome();
                  },
                  label: context.l10n.signup,
                ),

                // Divider
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey[300],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          S.alternate_signup,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ),

                // Social Login Buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcons(
                      icon: FontAwesomeIcons.google,
                      color: Colors.red,
                    ),
                    SizedBox(width: 16),
                    SocialIcons(
                      icon: FontAwesomeIcons.facebook,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 16),
                    SocialIcons(
                      icon: FontAwesomeIcons.github,
                      color: Colors.black,
                    ),
                  ],
                ),

                // Footer
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.already_have_account,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => context.goToLogin(),
                      child: Text(
                        S.login,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
