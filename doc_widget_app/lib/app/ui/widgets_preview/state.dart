import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doc_widget/doc_widget.dart';
import 'package:app_widgets/app_widgets.dart';

class WidgetsPreviewState {
  RxInt selectedIndex = RxInt(-1);
  RxList<ElementPreview> elements = RxList<ElementPreview>([]);

  void setup(){
    final button = ElementPreview(
      document: ButtonDocWidget(), // From generated file
      previews: [
        WidgetPreview(
          // This will show your widget and a description about.
          widget: Button(
            'Button',
            onPressed: () => debugPrint('Hello'),
          ),
          description: 'Default button.',
        ),
      ],
    );

    elements.value = [button];
  }
}
