import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nukeviet/src/themes/default/color.dart';
import 'package:nukeviet/src/themes/default/styles.dart';
class CustomFormInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool obscureText;
  final FocusNode focusNode;
  final List<TextInputFormatter> inputFormatters;
  final Widget suffixIcon;
  final Function validator;
  final bool enabled;
  final int maxLines;
  final double radius;
  final bool required;
  final TextCapitalization textCapitalization;
  final Function onChanged;
  CustomFormInput({
    this.controller,
    this.labelText = '',
    this.keyboardType,
    this.focusNode,
    this.obscureText = false,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.enabled = true,
    this.required = false,
    this.onChanged,
    this.maxLines = 1,
    this.radius = 5,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(12, 16, 8, 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColor.deactive,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColor.deactive,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColor.main,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColor.error,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColor.error,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColor.deactive,
          ),
        ),
        labelText: labelText + (required ? " *" : ""),
        hintText: labelText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: enabled ? Colors.white : AppColor.deactive,
      ),
      style: AppStyle.normal,
      enabled: enabled,
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      obscureText: obscureText,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      validator: validator,
    );
  }
}