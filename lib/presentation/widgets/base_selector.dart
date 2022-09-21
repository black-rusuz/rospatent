import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../providers/style.dart';

class BaseSelector extends StatefulWidget {
  final List<String> values;
  final EdgeInsets margin;

  const BaseSelector({
    super.key,
    required this.values,
    this.margin = EdgeInsets.zero,
  });

  @override
  State<BaseSelector> createState() => _BaseSelectorState();
}

class _BaseSelectorState extends State<BaseSelector> {
  int selectedIndex = 0;

  Widget mapValues(String value) => Center(child: Text(value));

  // TODO: Callback
  void onSelect(int index) => setState(() => selectedIndex = index);

  void showSelect(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: CupertinoPicker(
          itemExtent: 50,
          onSelectedItemChanged: onSelect,
          children: widget.values.map(mapValues).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: InkWell(
        onTap: () => showSelect(context),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                widget.values[selectedIndex],
                style: const TextStyle(
                  color: Styles.primaryLight,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 16,
                  color: Styles.primaryLight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
