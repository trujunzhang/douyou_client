// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class ButtonDocWidget implements Documentation {
  @override
  String get name => 'Button';
  @override
  bool get hasState => false;
  @override
  List<PropertyDoc> get properties => [
        PropertyDoc(
          name: 'text',
          isRequired: true,
          isNamed: false,
          type: 'String',
        ),
        PropertyDoc(
          name: 'key',
          isRequired: false,
          isNamed: true,
          type: 'Key?',
        ),
        PropertyDoc(
          name: 'onPressed',
          isRequired: true,
          isNamed: true,
          type: 'void Function()',
        ),
        PropertyDoc(
          name: 'color',
          isRequired: false,
          isNamed: true,
          type: 'Color',
          defaultValue: 'const Color(0xff007aff)',
        ),
      ];
  @override
  String get snippet => '''final button = Button(
  'Button',
  onPressed: () => print('doc_widget'),
);
''';
}
