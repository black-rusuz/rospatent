import 'package:flutter/material.dart';

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
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.06),
              blurRadius: 60,
              offset: Offset(0, 60),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.0413989),
              blurRadius: 20,
              offset: Offset(0, 20),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.0333774),
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.0266226),
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.0186011),
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: placeholder ?? '',
            suffixIcon: IconButton(icon: icon, onPressed: onPressed),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
