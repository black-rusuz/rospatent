import 'package:flutter/material.dart';

import '../providers/style.dart';

class BaseTextField extends StatelessWidget {
  final EdgeInsets margin;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? placeholder;
  final Widget? icon;
  final VoidCallback? onIconPressed;

  const BaseTextField({
    super.key,
    this.margin = EdgeInsets.zero,
    this.controller,
    this.textInputAction,
    this.placeholder,
    this.icon,
    this.onIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: const BoxDecoration(boxShadow: Styles.shadows),
      child: TextField(
        controller: controller,
        textInputAction: textInputAction,
        onEditingComplete: onIconPressed,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: placeholder,
          suffixIcon: icon == null
              ? null
              : IconButton(icon: icon!, onPressed: onIconPressed),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
