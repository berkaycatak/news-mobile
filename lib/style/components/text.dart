import 'package:flutter/material.dart';

class TextComponents {
  static Widget titleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Widget newsTitleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
