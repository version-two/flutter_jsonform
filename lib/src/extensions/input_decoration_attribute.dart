import 'package:flutter/material.dart';
import 'package:flutter_jsonform/src/extensions/text_style_attribute.dart';

extension FromJson on InputDecoration {
  InputDecoration fromJson(dynamic jsonDefinition) {
    Map<String, dynamic> json = jsonDefinition;
    var style = new InputDecoration();

    if (json.containsKey('label')) {
      style = style.copyWith(labelText: json['label'].toString());
    }
    if (json.containsKey('label_style')) {
      style = style.copyWith(
          labelStyle: TextStyle(inherit: true).fromJson(json['label_style']));
    }
    if (json.containsKey('content_padding')) {
      style = style.copyWith(
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10));
    }

    return style;
  }
}
