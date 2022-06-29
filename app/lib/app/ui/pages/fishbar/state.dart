import 'package:get/get.dart';
import 'package:app_rest/app_rest.dart';

class FishBarState {
  Rx<int> navActIndex = Rx<int>(0);
  Rx<int?> direction = Rx<int?>(null);
}
