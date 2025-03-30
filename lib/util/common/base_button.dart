import 'package:expense_tracker/util/colors.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.onPressed,
    super.key,
    this.textColor = const Color(0xFFFFFFFF),
    this.backgroundColor = const Color(0xFF000000),
    this.width = 200,
    this.height = 50,
    this.withIcon = false,
    this.label = 'Button',
    this.icon = const Icon(Icons.add),
  });
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final bool withIcon;
  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: withIcon
          ? ElevatedButton.icon(
              onPressed: onPressed,
              label: Text(label),
              icon: const Icon(Icons.add),
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                foregroundColor: WidgetStateProperty.all(textColor),
              ),
            )
          : ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).colorScheme.primary,
                elevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 56),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
    );
  }
}

class PrimaryButton extends BaseButton {
  const PrimaryButton({
    required super.onPressed,
    super.key,
    super.width,
    super.height,
    bool hasIcon = false,
    super.icon,
    super.label = '',
  }) : super(
          backgroundColor: AppColors.primary,
          textColor: Colors.white,
          withIcon: hasIcon,
        );
}

class SecondaryButton extends BaseButton {
  const SecondaryButton({
    required super.onPressed,
    super.key,
    super.width,
    super.height,
    super.icon,
    bool hasIcon = false,
    super.label = '',
  }) : super(
          backgroundColor: AppColors.tertiary,
          textColor: AppColors.primary,
          withIcon: hasIcon,
        );
}
