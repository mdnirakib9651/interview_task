// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final bool? enabled;
  final bool? readOnly;
  final TextEditingController? controller;
  final String? initialValue;
  final TextInputType? keyboardType;
  final String? titleText;
  final String? labelText;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final Widget? sufixIcon;
  final bool? filled;
  final Color? fillColor;
  final String? obscuringCharacter;
  final bool isPasswordField;
  final int? maxLine;
  final bool autofocus;
  final bool autocurrent;
  final bool? isDense;
  final Function(String)? onChange;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    this.enabled,
    this.readOnly,
    this.controller,
    this.initialValue,
    this.keyboardType,
    this.titleText,
    this.labelText,
    this.hintText,
    this.labelTextStyle,
    this.hintTextStyle,
    this.prefixIcon,
    this.prefixIconColor,
    this.sufixIcon,
    this.suffixIconColor,
    this.fillColor,
    this.filled = false,
    this.obscuringCharacter,
    this.maxLine,
    this.validator,
    this.onChange,
    this.floatingLabelBehavior,
    this.isPasswordField = false,
    this.autofocus = false,
    this.autocurrent = false,
    this.isDense = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.isPasswordField) isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleText == null
            ? const SizedBox.shrink()
            : Text(widget.titleText ?? "",
            style: const TextStyle(
              fontWeight: FontWeight.w400
            )
        ),
        /// When I give the title text it will take the sizedbox
        widget.titleText != null ? const SizedBox(height: 5) : const SizedBox.shrink(),
        TextFormField(
          autofocus: widget.autofocus,
          enabled: widget.enabled,
          autocorrect: widget.autocurrent,
          readOnly: widget.readOnly ?? false,
          enableIMEPersonalizedLearning: false,
          initialValue: widget.initialValue,
          controller: widget.controller,
          obscureText: isVisible,
          obscuringCharacter: widget.obscuringCharacter ?? "•",
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLine ?? 1,
          onChanged: widget.onChange,
          decoration: inputDecoration.copyWith(
            isDense: widget.isDense,
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle,
            labelText: widget.labelText,
            labelStyle: widget.labelTextStyle,
            prefixIcon: widget.prefixIcon,
            filled: widget.filled,
            fillColor: widget.fillColor,
            floatingLabelBehavior: widget.floatingLabelBehavior,
            /// When the visibility icon is neededIf isPasswordField is set-
            /// -to true in suffixIcon, auto visibility icon will appear
            suffixIcon: widget.isPasswordField
                ? IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
            ) : widget.sufixIcon,
          ),
          cursorColor: Colors.grey,
          // validator: widget.validator ?? (val){
          //   if(val!.isEmpty){
          //     if (widget.labelText != null){
          //       return "${widget.labelText} is required!";
          //     }
          //     return "This filed is required!";
          //   }
          //   return null;
          // },
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}


InputDecoration inputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: const BorderSide(
      width: 0.8,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(18),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.8,
      color: Colors.red,
    ),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.8,
      color: Colors.red,
    ),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.8,
      color: Colors.grey,
    ),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      width: 0.8,
      color: Colors.grey,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(width: 1.5, color: Colors.grey,),
    borderRadius: BorderRadius.circular(8),
  ),

);
