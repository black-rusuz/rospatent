import 'package:flutter/material.dart';

import '../providers/style.dart';

class BaseButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData? icon;
  final String title;
  final EdgeInsets margin;

  const BaseButton({
    super.key,
    this.onTap,
    this.icon,
    required this.title,
    this.margin = EdgeInsets.zero,
  });

  BorderRadius get radius => BorderRadius.circular(5);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: InkWell(
        onTap: onTap,
        customBorder: RoundedRectangleBorder(borderRadius: radius),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    icon,
                    size: 16,
                    color: Styles.primaryLight,
                  ),
                ),
              Text(
                title,
                style: const TextStyle(
                  color: Styles.primaryLight,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
