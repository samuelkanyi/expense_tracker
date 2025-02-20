import 'package:expense_tracker/util/colors.dart';
import 'package:flutter/material.dart';


class BaseButton extends StatelessWidget {

  const BaseButton({
    this.textColor = const Color(0xFFFFFFFF),
    // required this.child,
    this.backgroundColor = const Color(0xFF000000),
    required this.onPressed,
    this.width = 200,
    this.height = 50,
  });
  final Color textColor;
  // final Widget child;
  final Color backgroundColor;
  final Function onPressed;
  final double width;
  final double height;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: () {},
        child: Text('Button'),
        //add border radius to button
        style: ButtonStyle(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          backgroundColor: WidgetStateProperty.all(AppColors.violet100),
          foregroundColor: WidgetStateProperty.all(textColor),
        ),
      ),
    );
  }

}
