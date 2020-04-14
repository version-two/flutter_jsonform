import 'package:flutter/material.dart';
import 'package:flutter_jsonform/flutter_jsonform.dart';
import 'package:flutter_jsonform/src/elements/form_element.dart';
import 'package:flutter_jsonform/src/extensions/input_decoration_attribute.dart';
import 'package:flutter_jsonform/src/extensions/text_style_attribute.dart';
import 'package:meta/meta.dart';

enum TextFieldElementType {
  text,
  textBox,
  number,
  password,
  date,
  time,
  dateTime
}

class TextFieldElement extends FormElement {
  @required
  String id;
  TextFieldElementType type;
  TextInputType keyboardType;
  TextStyle textStyle;
  InputDecoration inputDecoration;
  int maxLines;
  int maxLength;
  bool maxLengthEnforced;
  Function onChange;
  ValueHandler valueHandler;

  TextFieldElement({
    this.id,
    this.valueHandler,
    this.type,
    this.keyboardType,
    this.textStyle,
    this.inputDecoration,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChange,
  });

  @factory
  TextFieldElement fromJson(
      Map<String, dynamic> jsonDefinition, ValueHandler valueHandler) {
    return new TextFieldElement(
        id: jsonDefinition['id'],
        valueHandler: valueHandler,
        type: jsonDefinition.containsKey('type')
            ? TextFieldElementType.values.firstWhere((e) =>
                e.toString() ==
                "TextFieldElementType." + jsonDefinition['type'])
            : TextFieldElementType.text,
        keyboardType: jsonDefinition.containsKey('keyboard_type')
            ? TextInputType.values.firstWhere(
                (e) => e.toString() == jsonDefinition['keyboard_type'])
            : TextInputType.text,
        textStyle: jsonDefinition.containsKey('text_style')
            ? TextStyle().fromJson(jsonDefinition['text_style'])
            : TextStyle(),
        inputDecoration: jsonDefinition.containsKey('decoration')
            ? InputDecoration().fromJson(jsonDefinition['decoration'])
            : InputDecoration(),
        maxLines: 1,
        maxLength: 500,
        maxLengthEnforced: false);
  }

  Widget render() {
    return TextFormField(
      initialValue: this.getValue(),
      style: textStyle,
      decoration: inputDecoration,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      maxLengthEnforced: maxLengthEnforced,
      onChanged: (value) {
        this.setValue(value);
      },
    );
  }

  bool isValid() {
    return true;
  }
}
