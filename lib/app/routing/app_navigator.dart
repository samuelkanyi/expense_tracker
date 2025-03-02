import 'package:expense_tracker/app/routing/router_names.dart';
import 'package:expense_tracker/login_guide/view/login_guide_page.dart';
import 'package:expense_tracker/sign_up/view/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


final router = GoRouter(
  routes: [
    GoRoute(path: RouterNames.home, pageBuilder: (context, state) =>  MaterialPage(
      key: state.pageKey,
      child: const LoginGuidePage(),
    ),),

    GoRoute(path: RouterNames.signUp, pageBuilder: (context, state) =>  MaterialPage(
      key: state.pageKey,
      child: SignUpPage(),
    ),),

  ],
);
