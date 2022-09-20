import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final EdgeInsets padding;
  final TextEditingController? controller;
  final String? placeholder;
  final Icon? icon;

  const BaseTextField({
    super.key,
    this.padding = EdgeInsets.zero,
    this.controller,
    this.placeholder,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: placeholder ?? '',
          suffixIcon: icon,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
