import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final TextAlign? textAlign;
  final TextInputType? keyBoardType;
  final String? Function(String? value)? validationCallback;
  final void Function()? onEdittingComplete;
  final String? formError;
  final String label;
  final String? hintText;
  final FocusNode? focusnode;
  final TextEditingController? controller;
  final String? message;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;
  final Function()? clearForm;
  final Function()? onTap;
  final Function(String)? onChanged;
  final int? maxLength;
  final bool? enabled;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final Color? fillColor;
  final Color? hintColor;
  final bool? showCursor;
  final bool readOnly;
  final Widget? labelRightItem;
  final TextStyle? labelStyle;
  final int? minLines;
  final int? maxLines;
  final String? initialValue;
  final Widget? suffixTitle;
  final String title;
  final Color? titleColor;
  final bool? autocorrect;
  final TextInputAction? textInputAction;
  final String? errorText;
  final String? labelText;

  const InputField({
    super.key,
    this.autovalidateMode,
    this.inputFormatters,
    this.textAlign,
    this.keyBoardType,
    this.onEdittingComplete,
    this.validationCallback,
    this.message,
    this.hintText,
    this.label = '',
    this.formError,
    this.focusnode,
    this.controller,
    this.clearForm,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.onTap,
    this.maxLength,
    this.minLines = 1,
    this.maxLines,
    this.enabled = true,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.fillColor,
    this.hintColor,
    this.showCursor,
    this.readOnly = false,
    this.labelRightItem,
    this.labelStyle,
    this.initialValue,
    this.suffixTitle,
    this.title = '',
    this.titleColor,
    this.autocorrect,
    this.textInputAction,
    this.errorText,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      showCursor: showCursor,
      readOnly: readOnly,
      maxLength: maxLength,
      enabled: enabled,
      onTap: onTap,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      autovalidateMode: autovalidateMode,
      focusNode: focusnode,
      controller: controller,
      onChanged: onChanged,
      validator: validationCallback,
      keyboardType: keyBoardType,
      inputFormatters: inputFormatters,
      onEditingComplete: onEdittingComplete,
      obscureText: obscureText ?? false,
      autocorrect: autocorrect ?? true,
      textInputAction: textInputAction,
      decoration: InputDecoration(
          errorText: errorText,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(color: Color(0xff9CA3AF), width: 1.0)),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          labelText: labelText,
          hintStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: hintColor ?? Colors.black),
          fillColor: Colors.white,
          hoverColor: Colors.blue,
          filled: true,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
          //contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(color: Color(0xff9CA3AF), width: 1.0))),
    );
  }
}
