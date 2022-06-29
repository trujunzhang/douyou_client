import 'package:get/get.dart';
import 'package:app_rest/app_rest.dart';

class SwiperListState {
  Rx<String> displayName = Rx<String>('');

  Rx<List<String>> swiperMenus = Rx<List<String>>([]);
}
