import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  const CustomPhoneField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.label});

  @override
  State<CustomPhoneField> createState() => _CustomPhoneFieldState();
}

class _CustomPhoneFieldState extends State<CustomPhoneField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: IntlPhoneField(
          controller: widget.controller,
          keyboardType: TextInputType.phone,
          disableLengthCheck: true,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.blueGrey, width: 1),
            ),
          ),
        ));
  }
}
