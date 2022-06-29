import 'package:json_annotation/json_annotation.dart';

import '../entities/lottery_config.dart';

part 'lottery_config_response.g.dart';

@JsonSerializable()
class LotteryConfigResponse {
  int? error;
  String? msg;
  @JsonKey(name: 'data')
  LotteryConfig? lotteryConfig;

  LotteryConfigResponse({this.error, this.msg, this.lotteryConfig});

  factory LotteryConfigResponse.fromJson(Map<String, dynamic> json) {
    return _$LotteryConfigResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LotteryConfigResponseToJson(this);
}
