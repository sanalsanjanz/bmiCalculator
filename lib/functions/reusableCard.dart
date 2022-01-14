// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {this.background, this.child, this.colour, this.onPressed, this.height});
  final Color? background;
  final Widget? child;
  final Color? colour;
  final VoidCallback? onPressed;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: height,
        child: child,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
