import 'package:get/get.dart';
import 'package:app_rest/app_rest.dart';

class LotteryState {
  Rx<LotteryConfig?> lotteryConfig = Rx<LotteryConfig?>(null);
  Rx<LotteryResult?> lotteryResult = Rx<LotteryResult?>(null);
  Rx<int?> runCount = Rx<int?>(null); // 九宫格转动时的次数累计
}
