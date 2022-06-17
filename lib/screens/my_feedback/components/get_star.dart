import 'package:flutter/material.dart';

List<Widget> getAllStars(int rate) {
  List<Icon> stars = getStars(rate);
  List<Icon> nonStars = getNonStar(rate);
  List<Widget> allStars = new List.from(stars)..addAll(nonStars);
  return allStars;
}

List<Icon> getNonStar(int rate) {
  return  List<Icon>.generate(rate, (i) => Icon(Icons.star,
      color: Colors.yellow));
}

List<Icon> getStars(int rate) {
   return  List<Icon>.generate(5-rate, (i) => Icon(Icons.star_border,
        color: Colors.yellow));
}