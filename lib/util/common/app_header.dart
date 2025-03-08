import 'package:expense_tracker/app/routing/app_navigator.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({required this.label, super.key});
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
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
