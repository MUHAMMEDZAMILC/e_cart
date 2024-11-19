import 'package:flutter/material.dart';

class ScreenUtil {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  static init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
  }
  
 
}