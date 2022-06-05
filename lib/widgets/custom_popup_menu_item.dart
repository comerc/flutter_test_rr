import 'package:flutter/material.dart';

class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  const CustomPopupMenuItem({
    Key? key,
    value,
    onTap,
    enabled = true,
    height = 0,
    padding = EdgeInsets.zero,
    textStyle,
    mouseCursor,
    required child,
  }) : super(
          key: key,
          value: value,
          onTap: onTap,
          enabled: enabled,
          height: height,
          padding: padding,
          textStyle: textStyle,
          mouseCursor: mouseCursor,
          child: child,
        );

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() =>
      CustomPopupMenuItemState<T, PopupMenuItem<T>>();
}

class CustomPopupMenuItemState<T, W extends PopupMenuItem<T>>
    extends PopupMenuItemState<T, W> {
  @override
  @protected
  void handleTap() {
    widget.onTap?.call();
    // Navigator.pop<T>(context, widget.value);
  }
}
