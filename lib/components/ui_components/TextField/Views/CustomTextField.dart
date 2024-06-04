import 'package:awekon/components/ui_components/TextField/Views/CustomPhoneField.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final IconData icon;
  final String hint;
  final String label;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.icon,
    required this.hint,
    required this.label,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    Widget? suffixWidget;
    if (widget.inputType == TextInputType.phone) {
      return CustomPhoneField(
          label: widget.label,
          controller: widget.controller,
          hint: widget.hint);
    }
    if (widget.inputType == TextInputType.visiblePassword) {
      suffixWidget = IconButton(
        icon: isVisible
            ? const Icon(Icons.visibility_outlined)
            : const Icon(Icons.visibility_off_rounded),
        onPressed: () {
          setState(() {
            isVisible = !(isVisible);
          });
        },
      );
    }

    emailValidator(String? value) {
      if (value != "" && (!value!.contains('@') || !value.contains('.'))) {
        return "Enter a valid email address";
      }
    }

    passwordValidator(String? value) {
      if (value != "" && !(value!.length >= 8)) {
        return "Enter atleast 8 character long password";
      }
    }

    validator(String? value) {
      if (widget.inputType == TextInputType.emailAddress) {
        return emailValidator(value!);
      } else if (widget.inputType == TextInputType.visiblePassword) {
        return passwordValidator(value!);
      }
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: TextFormField(
        obscureText:
            widget.inputType == TextInputType.visiblePassword && !isVisible
                ? true
                : false,
        controller: widget.controller,
        keyboardType: widget.inputType,
        validator: emailValidator,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: Icon(widget.icon),
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: suffixWidget,
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
      ),
    );
  }
}
