import 'package:flutter/material.dart';
import 'package:flutter_jsonform/flutter_jsonform.dart';
import 'package:flutter_jsonform/src/elements/attributes/input_decoration_attribute.dart';
import 'package:flutter_jsonform/src/elements/attributes/text_style_attribute.dart';
import 'package:flutter_jsonform/src/elements/form_element.dart';

enum TextFieldElementType { text, textBox, number, password, date, time, dateTime }

class TextFieldElement extends FormElement {
  final TextFieldElementType type;
  final TextInputType keyboardType;
  final TextStyle textStyle;
  final InputDecoration inputDecoration;
  final int maxLines;
  final int maxLength;
  final bool maxLengthEnforced;
  final Function onChange;

  TextFieldElement(
    Map<String, dynamic> definition,
    String id,
    ValueHandler valueHandler, {
    this.type,
    this.keyboardType,
    this.textStyle,
    this.inputDecoration,
    this.maxLines,
    this.maxLength,
    this.maxLengthEnforced,
    this.onChange,
  }) : super(definition, id, valueHandler);

  factory TextFieldElement.fromJson(
      Map<String, dynamic> jsonDefinition, ValueHandler valueHandler) {
    return new TextFieldElement(jsonDefinition, jsonDefinition['id'], valueHandler,
        type: jsonDefinition.containsKey('type')
            ? TextFieldElementType.values.firstWhere((e) => e.toString() == jsonDefinition['type'])
            : TextFieldElementType.text,
        keyboardType: jsonDefinition.containsKey('keyboard_type')
            ? TextInputType.values
                .firstWhere((e) => e.toString() == jsonDefinition['keyboard_type'])
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
    print(keyboardType);
    return TextFormField(
      initialValue: valueHandler.getValue(id),
      style: textStyle,
      decoration: inputDecoration,
      keyboardType: keyboardType,
      maxLines: maxLines,
      maxLength: maxLength,
      maxLengthEnforced: maxLengthEnforced,
      onChanged: (value) {
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
