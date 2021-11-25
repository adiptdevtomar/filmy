import 'package:flutter/material.dart';

TextStyle headingStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w600,
);

InputDecoration textFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.only(left: 15.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide.none,
  ),
  filled: true,
  fillColor: Colors.white.withOpacity(0.1),
);

class Names{
  static const String hiveBox = "movies";
  static const String authenticationDetailsKey = 'authentication_details';
}

enum ViewStatus {
  init,
  loading,
  success,
  failed,
}
