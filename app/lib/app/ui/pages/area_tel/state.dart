import 'package:app_rest/app_rest.dart';
import 'package:get/get.dart';
import 'package:app_rest/app_rest.dart';

class AreaTelState {
  Rx<AreaTel?> areaTel = Rx<AreaTel?>(null);
  Rx<int?> actLetter = Rx<int?>(null); // 当前触摸区域字母的索引
  Rx<Map?> letterScrollTopMap = Rx<Map?>(null);
}
