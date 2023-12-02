
import 'package:flutter/material.dart';

import 'custom_text_filed.dart';

class CustomDropDownFormField extends StatefulWidget {
  final String? titleText;
  final String? hintText;
  final String? labelText;
  final TextStyle? titleStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final String value;
  final bool? filled;
  final Color? fillColor;
  final double? height;
  final double? menuMaxHeight;
  final bool? isDense;
  final List<String> items;
  final Widget? prefixIcon;
  final Widget? sufixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final InputDecoration? decoration;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  const CustomDropDownFormField({
    Key? key,
    this.titleText,
    this.labelText,
    this.hintText,
    this.titleStyle,
    this.labelTextStyle,
    this.hintTextStyle,
    required this.value,
    this.decoration,
    this.filled = false,
    this.fillColor,
    this.height,
    this.menuMaxHeight,
    required this.items,
    required this.onChanged,
    this.prefixIcon,
    this.sufixIcon,
    this.validator,
    this.contentPadding,
    this.isDense = false,
  }) : super(key: key);

  @override
  State<CustomDropDownFormField> createState() => _CustomDropDownFormFieldState();
}

class _CustomDropDownFormFieldState extends State<CustomDropDownFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.titleText == null
            ? const SizedBox.shrink()
            : Text(widget.titleText ?? "",
            style: widget.titleStyle
                ?? const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),
            overflow: TextOverflow.ellipsis
        ),
        /// When I give the title text it will take the sizedbox
        widget.titleText != null ? const SizedBox(height: 5) : const SizedBox.shrink(),
        DropdownButtonFormField<String>(
          items: widget.items.map((itemValue) => DropdownMenuItem<String>(
            value: itemValue,
            child: Text(
              itemValue,
              maxLines: 1,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),
            ),
          ),
          ).toList(),
          menuMaxHeight: widget.menuMaxHeight ?? 200,
          value: widget.value,
          isExpanded: true,
          decoration: widget.decoration?.copyWith(
            contentPadding: widget.contentPadding,
            isDense: widget.isDense,
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle
                ?? const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),
            labelText: widget.labelText,
            labelStyle: widget.labelTextStyle
                ?? const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),
            prefixIcon: widget.prefixIcon,
            filled: widget.filled,
            fillColor: widget.fillColor,
          ) ?? inputDecoration.copyWith(
            contentPadding: widget.contentPadding,
            isDense: widget.isDense,
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle
                ?? const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),
            labelText: widget.labelText,
            labelStyle: widget.labelTextStyle
                ?? const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                ),
            prefixIcon: widget.prefixIcon,
            filled: widget.filled,
            fillColor: widget.fillColor,
          ),
          icon: widget.sufixIcon ?? const Icon(
            Icons.arrow_circle_down_rounded,
            color: Colors.grey,
          ),
          onChanged: widget.onChanged,
          // validator: widget.validator ?? (val){
          //   if(val!.isEmpty){
          //     if (widget.labelText != null){
          //       return "${widget.labelText} is required!";
          //     }
          //     return "This filed is required!";
          //   }
          //   return null;
          // },
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black
          ),
        ),
      ],
    );
  }
}