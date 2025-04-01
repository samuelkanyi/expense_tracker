import 'package:expense_tracker/util/colors.dart';
import 'package:flutter/material.dart';

enum ButtonStatus { enabled, disabled, loading }

class BaseButton extends StatelessWidget {
  const BaseButton(
      {required this.onPressed,
      super.key,
      this.textColor = const Color(0xFFFFFFFF),
      this.backgroundColor = const Color(0xFF000000),
      this.width = 200,
      this.height = 50,
      this.withIcon = false,
      this.label = 'Button',
      this.icon = const Icon(Icons.add),
      this.buttonStatus = ButtonStatus.enabled});
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final bool withIcon;
  final String label;
  final Icon icon;
  final ButtonStatus buttonStatus;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonStatus == ButtonStatus.enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        disabledBackgroundColor: Colors.grey.shade300,
        disabledForegroundColor: Colors.grey.shade600,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        minimumSize: const Size(double.infinity, 56),
      ),
      child: buttonStatus == ButtonStatus.loading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: AppColors.primary,
              ),
            )
          : Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
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
    bool isLoading = false,
  }) : super(
            backgroundColor: AppColors.primary,
            textColor: Colors.white,
            withIcon: hasIcon,
            buttonStatus:
                isLoading ? ButtonStatus.loading : ButtonStatus.enabled);
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
