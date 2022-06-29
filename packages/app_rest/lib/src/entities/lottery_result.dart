import 'package:json_annotation/json_annotation.dart';

part 'lottery_result.g.dart';

@JsonSerializable()
class LotteryResult {
  String? giftName;
  int? giftIndex;

  LotteryResult({this.giftName, this.giftIndex});

  factory LotteryResult.fromJson(Map<String, dynamic> json) {
    return _$LotteryResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LotteryResultToJson(this);
}
