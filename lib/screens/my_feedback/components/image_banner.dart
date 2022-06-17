import 'package:flutter/material.dart';

class ImageBanner extends StatelessWidget{
  final String imagePath;
  final Color _color;
  ImageBanner(this.imagePath, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: _color
    ),
      child: Image.asset(imagePath,
      fit: BoxFit.fill),
    );
  }
}