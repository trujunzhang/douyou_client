// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lottery_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LotteryConfig _$LotteryConfigFromJson(Map<String, dynamic> json) =>
    LotteryConfig(
      pageBg: json['pageBg'] as String?,
      pageH: (json['pageH'] as num?)?.toDouble(),
      lotteryBg: json['lotteryBg'] as String?,
      lotteryH: (json['lotteryH'] as num?)?.toDouble(),
      lotteryW: (json['lotteryW'] as num?)?.toDouble(),
      highLightBg: json['highLightBg'] as String?,
      myRewardBg: json['myRewardBg'] as String?,
      myRewardH: (json['myRewardH'] as num?)?.toDouble(),
      myRewardW: (json['myRewardW'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LotteryConfigToJson(LotteryConfig instance) =>
    <String, dynamic>{
      'pageBg': instance.pageBg,
      'pageH': instance.pageH,
      'lotteryBg': instance.lotteryBg,
      'lotteryH': instance.lotteryH,
      'lotteryW': instance.lotteryW,
      'highLightBg': instance.highLightBg,
      'myRewardBg': instance.myRewardBg,
      'myRewardH': instance.myRewardH,
      'myRewardW': instance.myRewardW,
    };
