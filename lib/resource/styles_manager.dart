import 'package:flutter/material.dart';

class StyleManager {
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.9),
      spreadRadius: 0,
      blurRadius: 1,
      offset: const Offset(0, 2),
    )
  ];
  static BorderRadius border = const BorderRadius.all(
    Radius.circular(10),
  );
}
