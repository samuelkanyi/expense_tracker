import 'package:expense_tracker/app/routing/router_names.dart';
import 'package:expense_tracker/guide_screens/view/login_guide_page.dart';
import 'package:expense_tracker/login/view/login_view.dart';
import 'package:expense_tracker/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.home,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const LoginGuidePage(),
      ),
    ),
    GoRoute(
      path: RouterNames.signUp,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: SignUpView(),
      ),
    ),
    GoRoute(
      path: RouterNames.login,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: LoginView(),
      ),
    ),
  ],
);

extension NavigationExtension on BuildContext {
  void back() => GoRouter.of(this).pop();
  void navigateToHome() => GoRouter.of(this).go(RouterNames.home);
  void navigateToSignUp() => GoRouter.of(this).go(RouterNames.signUp);
}
