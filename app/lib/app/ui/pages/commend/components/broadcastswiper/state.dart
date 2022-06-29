import 'package:get/get.dart';
import 'package:app_rest/app_rest.dart';

class BroadCastSwiperState {
  Rx<String> displayName = Rx<String>('');

  Rx<List<BroadCast>> broadCastList = Rx<List<BroadCast>>([]);
}
