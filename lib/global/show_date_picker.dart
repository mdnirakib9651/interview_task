import 'package:flutter/material.dart';

Future<DateTime> datePickerDialog(BuildContext context) async {

  DateTime? selected = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2030),
  );
  return selected ?? DateTime.now();

}
