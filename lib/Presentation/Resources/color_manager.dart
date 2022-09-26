import 'package:flutter/material.dart';

class ColorManager {
  static Color splash = HexColor.hexString("#F68B1E");
  static Color red = HexColor.hexString("#B60000");
  static Color black1 = HexColor.hexString("#282828");
  static Color black0 = HexColor.hexString("#000000");
  static Color white = HexColor.hexString("#FFFFFF");
  static Color white1 = HexColor.hexString("#838388");
  static Color blue = HexColor.hexString("#3378DA");
  static Color white2 = HexColor.hexString("#DADADA");

}

extension HexColor on Color {
  static hexString(String hexValue) {
    hexValue = hexValue.replaceAll("#", "");
    if(hexValue.length == 6) {
      hexValue = "FF$hexValue";
    }
    return Color(int.parse(hexValue, radix: 16));
  }
}