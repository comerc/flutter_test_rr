import 'package:flutter/material.dart';

class FilterMenuItem extends StatefulWidget {
  const FilterMenuItem({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  final Text title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  @override
  State<FilterMenuItem> createState() => FilterMenuItemState();
}

class FilterMenuItemState<T> extends State<FilterMenuItem> {
  late bool value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            value = !value;
            widget.onChanged(value);
          },
        );
      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            SizedBox(width: 16),
            Expanded(child: widget.title),
            SizedBox(width: 8),
            Switch(
              value: value,
              onChanged: (bool value) {
                setState(
                  () {
                    this.value = value;
                    widget.onChanged(value);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
