import 'package:flutter_jsonform/flutter_jsonform.dart';

abstract class FormElement {
  final String id;
  final ValueHandler valueHandler;

  FormElement(this.id, this.valueHandler);

  setValue(dynamic newValue);

  //fromJson(Map<String, dynamic> definition);
}