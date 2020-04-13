import 'package:flutter/material.dart';

extension FromJson on Paint {
  Paint fromJson(Map<String, dynamic> json) {
    var style = Paint();
    if (json.containsKey('color')) {
      style.color = Color(int.parse(json['color']));
    }
    return style;
  }
}
