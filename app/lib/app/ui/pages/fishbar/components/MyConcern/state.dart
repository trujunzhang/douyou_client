import 'package:get/get.dart';
import 'package:app_rest/app_rest.dart';

class MyConcernState {
  Rx<String> displayName = Rx<String>('');

  Rx<List<Yuba>> yubaList = Rx<List<Yuba>>([]);
}
