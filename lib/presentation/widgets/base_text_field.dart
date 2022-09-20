import 'package:flutter/material.dart';

import '../providers/style.dart';

class BaseTextField extends StatelessWidget {
  final EdgeInsets padding;
  final TextEditingController? controller;
  final String? placeholder;
  final Widget icon;
  final VoidCallback? onPressed;

  const BaseTextField({
    super.key,
    this.padding = EdgeInsets.zero,
    this.controller,
    this.placeholder,
    this.icon = const SizedBox(),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: const BoxDecoration(boxShadow: Styles.shadows),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: placeholder ?? '',
            suffixIcon: IconButton(icon: icon, onPressed: onPressed),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
    );
  }
}
