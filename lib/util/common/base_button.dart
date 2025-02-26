
import 'package:expense_tracker/util/colors.dart';
import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    this.textColor = const Color(0xFFFFFFFF),
    this.backgroundColor = const Color(0xFF000000),
    required this.onPressed,
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
    return Container(
      width: width,
      height: height,
      child: withIcon
          ? ElevatedButton.icon(
              onPressed: () => onPressed,
              label: Text(label),
              icon: Icon(Icons.add),
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
              child: Text(label),
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(backgroundColor),
                foregroundColor: WidgetStateProperty.all(textColor),
              ),
            ),
    );
  }
}

class PrimaryButton extends BaseButton {
  const PrimaryButton(
      {required Function onPressed,
      double width = 200,
      double height = 50,
      bool hasIcon = false,
      Icon icon = const Icon(Icons.add),
      String label = ''})
      : super(
          onPressed: onPressed,
          width: width,
          height: height,
          backgroundColor: AppColors.violet100,
          textColor: AppColors.light100,
          withIcon: hasIcon,
          label: label,
          icon: icon,
        );
}

class SecondaryButton extends BaseButton {
  const SecondaryButton({
    required Function onPressed,
    double width = 200,
    double height = 50,
    bool hasIcon = false,
  }) : super(
          onPressed: onPressed,
          width: width,
          height: height,
          backgroundColor: AppColors.violet20,
          textColor: AppColors.violet100,
        );
}
