library flutter_jsonform;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jsonform/src/elements/textfield_element.dart';

class FlutterJsonForm {
  final List<dynamic> jsonDefinition;

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
      elements.add(TextFieldElement.fromJson(value).render());
    });
    return elements;
    //formWidgetTree = new FormWidgetTree();
  }
}
