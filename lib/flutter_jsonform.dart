library flutter_jsonform;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jsonform/src/elements/form_element.dart';
import 'package:flutter_jsonform/src/elements/textfield_element.dart';
import 'package:flutter_jsonform/src/extensions/widget_extensions.dart';

class FlutterJsonForm {
  final List<dynamic> jsonDefinition;

  var _factories = <String, Function()>{
    'text': () => new TextFieldElement(),
  };

  ValueHandler _valueHandler = new ValueHandler();
  List<Widget> elements = new List<Widget>();

  FlutterJsonForm(this.jsonDefinition);

  FlutterJsonForm.fromJsonString(String jsonDefinitionString)
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
      if (value.containsKey('type') &&
          _factories.containsKey(value['type'].toString().toLowerCase())) {
        FormElement element = _factories[value['type'].toString().toLowerCase()]();
        element = element.fromJson(value, _valueHandler);
        elements.add(element.render());
      }
    });
    /*jsonDefinition.forEach((value) {
      Widget element = TextFieldElement.fromJson(value, _valueHandler).render();
      Map<dynamic, dynamic> map = {
        "top": 100.0,
        "left": 50.0,
        "right": 10.0,
        "bottom": 0.0
      };
      elements.add(element.wrapWith(WrapType.padding, map));
    });*/
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
    return jsonEncode(_values);
  }
}
