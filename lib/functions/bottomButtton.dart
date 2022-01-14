// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:avodha_moke/functions/const.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {this.height, this.weight, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final int? height;
  final int? weight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            text,
            style: kLabelTextStyle,
          ),
        ),
      ),
    );
  }
}
