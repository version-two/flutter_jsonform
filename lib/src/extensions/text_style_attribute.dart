import 'package:flutter/material.dart';

extension FromJson on TextStyle {
  TextStyle fromJson(dynamic jsonDefinition) {
    Map<String, dynamic> json = jsonDefinition;
    TextStyle style = new TextStyle();

    if (json.containsKey('color')) {
      style = style.copyWith(color: Color(int.parse(json['color'])));
    }

    if (json.containsKey('background_color')) {
      style = style.copyWith(
          backgroundColor: Color(int.parse(json['background_color'])));
    }

    if (json.containsKey('font')) {
      Map<String, dynamic> fontData = json['font'];
      if (fontData.containsKey('family')) {
        style = style.copyWith(fontFamily: fontData['family']);
      }
      if (fontData.containsKey('size')) {
        style = style.copyWith(fontSize: double.parse(fontData['size']));
      }
      if (fontData.containsKey('weight')) {
        style = style.copyWith(
            fontWeight: <String, FontWeight>{
          "100": FontWeight.w100,
          "200": FontWeight.w200,
          "300": FontWeight.w300,
          "400": FontWeight.w400,
          "500": FontWeight.w500,
          "600": FontWeight.w600,
          "700": FontWeight.w700,
          "800": FontWeight.w800,
          "900": FontWeight.w900,
          "normal": FontWeight.normal,
          "bold": FontWeight.bold,
        }[fontData['weight'].toString()]);
      }
    }

    return style;
  }
}
