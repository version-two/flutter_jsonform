import 'package:flutter/material.dart';
import 'package:widget_extensions/widget_extensions.dart';

enum WrapType { container, row, column, center, padding }

extension WrapWith on Widget {
  Widget wrapWith(WrapType wrapType, [attributes]) {
    Widget returnable;
    switch (wrapType) {
      case WrapType.center:
        returnable = Center(child: this).fromMap(attributes);
        break;
      case WrapType.container:
        returnable = Container(child: this);
        break;
      case WrapType.row:
        returnable = Row(children: [this]);
        break;
      case WrapType.column:
        returnable = Column(children: [this]);
        break;
      case WrapType.padding:
        returnable = Padding(
            child: this, padding: EdgeInsets.all(0).fromMap(attributes));
        break;
    }
    return returnable;
  }
}
