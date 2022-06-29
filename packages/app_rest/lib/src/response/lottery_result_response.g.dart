// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LotteryResultResponse _$LotteryResultResponseFromJson(
        Map<String, dynamic> json) =>
    LotteryResultResponse(
      error: json['error'] as int?,
      msg: json['msg'] as String?,
      data: json['data'] == null
          ? null
          : LotteryResult.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LotteryResultResponseToJson(
        LotteryResultResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'msg': instance.msg,
      'data': instance.data,
    };
