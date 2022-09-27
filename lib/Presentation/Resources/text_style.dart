import 'package:flutter/cupertino.dart';

TextStyle _getTextStyle(
        {required Color color,
        required double fontSize,
        required FontWeight fontWeight}) =>
    TextStyle(fontWeight: fontWeight, fontSize: fontSize, color: color);

//light textstyle

TextStyle lightTextStyle(
        {required Color color,
        double size = 16,
        FontWeight fontWeight = FontWeight.w300}) =>
    _getTextStyle(color: color, fontSize: size, fontWeight: fontWeight);
//regular textstyle
//bold textstyle
//medium textstyle
// black textstyle
