import 'package:flutter/material.dart';
import 'package:flutter_jsonform/flutter_jsonform.dart';
import 'package:flutter_jsonform/src/elements/form_element.dart';

class DropdownButtonElement extends FormElement {
  List<DropdownMenuItem<String>> _items;

  DropdownButtonElement(String id, ValueHandler valueHandler, dynamic items)
      : super(id, valueHandler) {
    if (items is Map<String, String>) {
      _items = List(items.length);  // Fixed-size list for better performance

      int index = 0;
      items.forEach((String key, String val) {
        _items[index] = DropdownMenuItem(
          value: key,
          child: Text(val),
        );
      });
    } else {
      items = items as List<String>;
      final int len = items.length;
      _items = List(len);  // Fixed-size list for better performance

      for (int i = 0; i < len; i++) {
        _items[i] = DropdownMenuItem(
          child: Text(items[i]),
          value: items[i],
        );
      }
    }
  }

  DropdownButtonElement.fromJson(Map<String, dynamic> jsonDefinition, ValueHandler valueHandler)
      : this(jsonDefinition['id'], valueHandler, jsonDefinition['items']);

  Widget render() {
    return DropdownButton(
      items: _items,
      onChanged: (String value) {
        valueHandler.setValue(id, value);
      },
    );
  }

  @override
  setValue(newValue) {
    // TODO: implement setValue
    return null;
  }
}
