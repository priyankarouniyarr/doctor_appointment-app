//set constant config here
import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;

  //width and height initilaization
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }

//defining spacing height
  static const spacesmall = SizedBox(
    height: 25,
  );

  static final spaceMedium = SizedBox(height: screenHeight! * 0.05);

  static final spaceLarge = SizedBox(height: screenHeight! * 0.08);

//textform field border
  static const outlinedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.all(
    Radius.circular(10),
  ));
  static const focusBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent));

  static const errorBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red));

static  const primarycolor= Colors.blueAccent;







}



