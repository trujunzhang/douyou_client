// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LotteryConfigResponse _$LotteryConfigResponseFromJson(
        Map<String, dynamic> json) =>
    LotteryConfigResponse(
      error: json['error'] as int?,
      msg: json['msg'] as String?,
      lotteryConfig: json['data'] == null
          ? null
          : LotteryConfig.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LotteryConfigResponseToJson(
        LotteryConfigResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'msg': instance.msg,
      'data': instance.lotteryConfig,
    };
