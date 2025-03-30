import 'package:expense_tracker/app/routing/router_names.dart';
import 'package:expense_tracker/guide_screens/cubit/login_guide_cubit.dart';
import 'package:expense_tracker/l10n/l10n.dart';
import 'package:expense_tracker/util/common/base_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginGuideView extends StatelessWidget {
  const LoginGuideView({super.key});

  @override
  Widget build(BuildContext context) {
    final S = context.l10n;
    return Scaffold(
      body: BlocBuilder<PageCubit, int>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Flexible(
                  child: PageView(
                    controller: context.read<PageCubit>().pageController,
                    onPageChanged: (index) {
                      context.read<PageCubit>().changePage(index);
                    },
                    children: [
                      buildView(
                        'assets/illustrations/guide_screen_1.svg',
                        S.guide_screen_1_title,
                        S.guide_screen_1_desc,
                      ),
                      buildView(
                        'assets/illustrations/guide_screen_2.svg',
                        S.guide_screen_2_title,
                        S.guide_screen_2_desc,
                      ),
                      buildView(
                        'assets/illustrations/guide_screen_3.svg',
                        S.guide_screen_3_title,
                        S.guide_screen_3_desc,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Flexible(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: state == index ? Colors.black : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  onPressed: () {
                    context.go(RouterNames.signUp);
                  },
                  label: 'Sign Up',
                  width: double.infinity,
                ),
                const SizedBox(height: 16),
                SecondaryButton(
                  onPressed: () {
                    context.go(RouterNames.login);
                  },
                  label: 'Log In',
                  width: double.infinity,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildView(String illustration, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(illustration),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, color: Colors.white10),
        ),
      ],
    );
  }
}
