import 'package:flutter/material.dart';
import 'package:flutter_jsonform/src/elements/attributes/input_decoration_attribute.dart';
import 'package:flutter_jsonform/src/elements/attributes/text_style_attribute.dart';
import 'package:flutter_jsonform/src/elements/form_element.dart';

enum TextFieldElementKeyboardType {
  dateTime,
  emailAddress,
  multiline,
  number,
  numberWithOptions,
  phone,
  text,
  url,
  visiblePassword
}

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
  final TextFieldElementType type;
  final TextFieldElementKeyboardType keyboardType;
  final TextStyle textStyle;
  final InputDecoration inputDecoration;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;

  TextFieldElement(
      {this.type,
      this.keyboardType,
      this.textStyle,
      this.inputDecoration,
      this.maxLines,
      this.maxLength,
      this.maxLengthEnforced});

  factory TextFieldElement.fromJson(Map<String, dynamic> jsonDefinition) {
    return new TextFieldElement(
        type: jsonDefinition.containsKey('type')
            ? TextFieldElementType.values
                .firstWhere((e) => e.toString() == jsonDefinition['type'])
            : TextFieldElementType.text,
        keyboardType: jsonDefinition.containsKey('keyboard_type')
            ? TextFieldElementKeyboardType.values.firstWhere(
                (e) => e.toString() == jsonDefinition['keyboard_type'])
            : TextFieldElementKeyboardType.text,
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
      style: this.textStyle,decoration: inputDecoration,
    );
  }

  @override
  setValue(newValue) {
    // TODO: implement setValue
    return null;
  }
}
