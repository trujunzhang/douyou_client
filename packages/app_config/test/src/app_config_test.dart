import 'package:app_config/src/app_configs.dart';
import 'package:flutter_test/flutter_test.dart';

// https://pub.dev/packages/test
void main() {
  test('adds one to input values', () {
    // expect(AppConfigs.appbarHeight, isNot(156));
    expect(AppConfigs.appbarHeight, (156));
  });
}
