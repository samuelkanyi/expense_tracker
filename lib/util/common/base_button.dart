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
  final Function onPressed;
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
              onPressed: () => onPressed,
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
          : TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                foregroundColor: WidgetStateProperty.all(textColor),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}

class PrimaryButton extends BaseButton {
  const PrimaryButton(
      {required super.onPressed,
      super.key,
      super.width,
      super.height,
      bool hasIcon = false,
      super.icon,
      super.label = ''})
      : super(
          backgroundColor: AppColors.violet100,
          textColor: AppColors.light100,
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
          backgroundColor: AppColors.violet20,
          textColor: AppColors.violet100,
          withIcon: hasIcon,
        );
}
