import 'package:awekon/core/Theme/Theme.dart';
import 'package:flutter/material.dart';

class CustomGradientButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final double borderRadius;

  const CustomGradientButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    var gradient = AppThemes.isDark(context)
        ? AppThemes.GRADIENT_DARK
        : AppThemes.GRADIENT_LIGHT;

    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: IntrinsicWidth(
          child: Container(
            constraints: const BoxConstraints(
              minWidth: 0,
              minHeight: 36, // You can adjust the minHeight as needed
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
