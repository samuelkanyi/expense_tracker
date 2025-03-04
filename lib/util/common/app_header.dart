import 'package:expense_tracker/app/routing/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key, required this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => context.navigateToHome(),
          ),
          Expanded(child: Container()),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
