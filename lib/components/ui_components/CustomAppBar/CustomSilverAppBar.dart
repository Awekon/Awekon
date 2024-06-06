import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  final Widget? title;
  final List<Widget>? actions;

  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: title,
      floating: true,
      pinned: false,
      snap: true,
      actions: actions,
    );
  }
}
