import 'package:expense_tracker/util/colors.dart';
import 'package:expense_tracker/util/dimensions.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  CustomInput({
    this.labelText = '',
    this.hintText = '',
    this.isPassword = false,
    this.hasSuffixIcon = false,
    this.suffixIcon = Icons.visibility,
    required this.controller,
    required this.onChanged,
    this.error = false,
  });
  final String labelText;
  final String hintText;
  final bool isPassword;
  final bool hasSuffixIcon;
  final IconData suffixIcon;
  final TextEditingController controller;
  final Function(String) onChanged;
  final bool error;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Dimensions.paddingL, vertical: Dimensions.paddingM),
      child: TextField(
        controller: widget.controller,
        onChanged: widget.onChanged,
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          suffixIcon: widget.hasSuffixIcon
              ? IconButton(
                  icon: Icon(widget.suffixIcon),
                  onPressed: () {},
                )
              : null,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.baseLight100),
            borderRadius: BorderRadius.all(Dimensions.cornerRadius),
          ),
        ),
      ),
    );
  }
}
