import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final EdgeInsets padding;
  final TextEditingController? controller;

  const BaseTextField({
    super.key,
    this.padding = EdgeInsets.zero,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        controller: controller,
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
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
