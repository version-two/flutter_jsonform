import 'package:flutter/material.dart';
import 'package:flutter_jsonform/flutter_jsonform.dart';
import 'package:meta/meta.dart';

abstract class FormElement {
  FormElement({this.id, this.valueHandler});

  @required
  String id;

  @required
  ValueHandler valueHandler;

  Widget render();

  @factory
  FormElement fromJson(
      Map<String, dynamic> jsonDefinition, ValueHandler valueHandler);

  setValue(value) {
    valueHandler.setValue(this.id, value);
  }

  getValue() {
    valueHandler.getValue(this.id);
  }

  bool isValid();
}
