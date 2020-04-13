library flutter_jsonform;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jsonform/src/elements/textfield_element.dart';

class FlutterJsonForm {
  final List<dynamic> jsonDefinition;

  ValueHandler _valueHandler = new ValueHandler();
  List<Widget> elements = new List<Widget>();

  FlutterJsonForm(this.jsonDefinition);

  FlutterJsonForm.fromString(String jsonDefinitionString)
      : jsonDefinition = json.decode(jsonDefinitionString);

  Widget render() {
    var formElements = _prepare();
    return Container(
      child: Column(
        children: formElements,
      ),
    );
  }

  List<Widget> _prepare() {
    elements = new List<Widget>();
    jsonDefinition.forEach((value) {
      elements.add(TextFieldElement.fromJson(value, _valueHandler).render());
    });
    return elements;
    //formWidgetTree = new FormWidgetTree();
  }

  String get result => _valueHandler.toJson();
}

class ValueHandler {
  Map<String, dynamic> _values = new Map<String, dynamic>();

  ValueHandler([Map<String, dynamic> initValues]) {
    if (initValues != null) {
      initializeValues(initValues);
    }
  }

  void initializeValues(values) {
    this._values = values;
  }

  void setValue(String elementId, dynamic value) {
    _values[elementId] = value;
  }

  dynamic getValue(String elementId) {
    return _values[elementId] ?? null;
  }

  String toJson() {
    print("Vals: "+_values.toString());
    return jsonEncode(_values);
  }
}
