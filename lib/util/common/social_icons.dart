import 'package:expense_tracker/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({required this.icon, required this.color, super.key});
  final IconData icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.buttonHeight,
      height: Dimensions.buttonHeight,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: FaIcon(
          icon,
          color: color,
          size: Dimensions.custom24,
        ),
      ),
    );
  }
}
