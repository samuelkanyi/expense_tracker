import 'package:expense_tracker/app/expense/view/add_expense_view.dart';
import 'package:expense_tracker/app/helpers/navigation_observer.dart';
import 'package:expense_tracker/app/routing/router_names.dart';
import 'package:expense_tracker/dashboard/view/dashboard_view.dart';
import 'package:expense_tracker/guide_screens/view/app_guide_page.dart';
import 'package:expense_tracker/login/view/login_view.dart';
import 'package:expense_tracker/settings/language_setting/language_selection_page.dart';
import 'package:expense_tracker/settings/main/view/setting_view.dart';
import 'package:expense_tracker/sign_up/view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: RouterNames.home,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const AppGuidePage(),
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
    GoRoute(
      path: RouterNames.dashboard,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const ExpenseDashboard(),
      ),
    ),
    GoRoute(
      path: RouterNames.settings,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SettingsView(),
      ),
    ),
    GoRoute(
      path: RouterNames.languageSelection,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const LanguageSelectionPage(),
      ),
    ),
    GoRoute(
      path: RouterNames.addExpense,
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const AddExpenseView(),
      ),
    ),
  ],
  observers: [CustomNavigationObserver()],
);

extension NavigationExtension on BuildContext {
  void back() => GoRouter.of(this).pop();
  void navigateToHome() => GoRouter.of(this).push(RouterNames.dashboard);
  void navigateToSignUp() => GoRouter.of(this).push(RouterNames.signUp);
  void goToLogin() => GoRouter.of(this).push(RouterNames.login);
}
