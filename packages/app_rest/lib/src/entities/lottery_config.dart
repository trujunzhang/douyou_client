import 'package:json_annotation/json_annotation.dart';

part 'lottery_config.g.dart';

@JsonSerializable()
class LotteryConfig {
  String? pageBg;
  double? pageH;
  String? lotteryBg;
  double? lotteryH;
  double? lotteryW;
  String? highLightBg;
  String? myRewardBg;
  double? myRewardH;
  double? myRewardW;

  LotteryConfig({
    this.pageBg,
    this.pageH,
    this.lotteryBg,
    this.lotteryH,
    this.lotteryW,
    this.highLightBg,
    this.myRewardBg,
    this.myRewardH,
    this.myRewardW,
  });

  factory LotteryConfig.fromJson(Map<String, dynamic> json) {
    return _$LotteryConfigFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LotteryConfigToJson(this);
}
