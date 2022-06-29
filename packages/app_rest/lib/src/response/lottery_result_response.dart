import 'package:json_annotation/json_annotation.dart';

import '../entities/lottery_result.dart';

part 'lottery_result_response.g.dart';

@JsonSerializable()
class LotteryResultResponse {
  int? error;
  String? msg;
  LotteryResult? data;

  LotteryResultResponse({this.error, this.msg, this.data});

  factory LotteryResultResponse.fromJson(Map<String, dynamic> json) {
    return _$LotteryResultResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LotteryResultResponseToJson(this);
}
