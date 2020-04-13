import 'package:flutter/material.dart';

class FormWidgetTree extends StatefulWidget {
  final List<Widget> elements;

  const FormWidgetTree({Key key, @required this.elements}) : super(key: key);

  @override
  _FormWidgetTreeState createState() => _FormWidgetTreeState();
}

class _FormWidgetTreeState extends State<FormWidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: widget.elements,
      ),
    );
  }
}
