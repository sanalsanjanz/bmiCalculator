// ignore: file_names
// ignore_for_file: use_key_in_widget_constructors, file_names, duplicate_ignore

import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  const RoundedIcon({required this.icon, required this.function});
  final IconData icon;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: function,
      fillColor: const Color(0xff4c4f5e),
      elevation: 8,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
