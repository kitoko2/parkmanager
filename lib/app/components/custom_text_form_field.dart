import 'package:flutter/material.dart';
import 'package:parkmanager/utils/constants/constant_colors.dart';
import 'package:parkmanager/utils/constants/constant_strings.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final void Function()? onTap;
  final bool readOnly;
  final String? initialValue;
  final bool autofocus;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool? obscureText;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.controller,
      this.onTap,
      this.obscureText = false,
      this.autofocus = false,
      this.keyboardType,
      this.onChanged,
      this.maxLines = 1,
      this.readOnly = false,
      this.focusNode,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxLines != null ? 50 : null,
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ConstantColors.lightgrayColor),
      child: TextFormField(
        onTap: onTap,
        obscureText: obscureText!,
        initialValue: initialValue,
        maxLines: maxLines,
        focusNode: focusNode,
        autofocus: autofocus,
        style: TextStyle(
            fontFamily: ConstantString.policeApp,
            fontSize: 19,
            fontWeight: FontWeight.w500),
        controller: controller,
        readOnly: readOnly,
        onChanged: onChanged,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 2),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: ConstantString.policeApp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
