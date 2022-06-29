import 'package:get/get.dart';
import 'package:app_rest/app_rest.dart';

class CommendState {
  Rx<List<String>> navMenus = Rx<List<String>>([]);

  Rx<int> liveListPage= Rx<int>(1);
  Rx<List<LiveDatum>> liveList = Rx<List<LiveDatum>>([]);
}