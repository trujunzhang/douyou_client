import 'package:app_models/src/enum/photo_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('photoTypeToString functions test', (WidgetTester tester) async {
    expect(PhotoType.None.vnText, 'none');
    expect(PhotoType.Restaurant.vnText, 'restaurant');
    expect(PhotoType.Recipe.vnText, 'recipe');
    expect(PhotoType.Waiter.vnText, 'waiter');
    expect(PhotoType.User.vnText, 'user');
  });
  testWidgets('stringToPhotoType functions test', (WidgetTester tester) async {
    expect(PhotoTypeExtension.fromString('none'), PhotoType.None);
    expect(PhotoTypeExtension.fromString('restaurant'), PhotoType.Restaurant);
    expect(PhotoTypeExtension.fromString('recipe'), PhotoType.Recipe);
    expect(PhotoTypeExtension.fromString('waiter'), PhotoType.Waiter);
    expect(PhotoTypeExtension.fromString('user'), PhotoType.User);
  });
}
