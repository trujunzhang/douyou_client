// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveDatum _$LiveDatumFromJson(Map<String, dynamic> json) => LiveDatum(
      rid: json['rid'] as int?,
      vipId: json['vipId'] as int?,
      roomName: json['roomName'] as String?,
      cate1Id: json['cate1Id'] as int?,
      cate2Id: json['cate2Id'] as int?,
      roomSrc: json['roomSrc'] as String?,
      verticalSrc: json['verticalSrc'] as String?,
      avatar: json['avatar'] as String?,
      nickname: json['nickname'] as String?,
      isVertical: json['isVertical'] as int?,
      liveCity: json['liveCity'] as String?,
      isLive: json['isLive'] as int?,
      hn: json['hn'] as String?,
    );

Map<String, dynamic> _$LiveDatumToJson(LiveDatum instance) => <String, dynamic>{
      'rid': instance.rid,
      'vipId': instance.vipId,
      'roomName': instance.roomName,
      'cate1Id': instance.cate1Id,
      'cate2Id': instance.cate2Id,
      'roomSrc': instance.roomSrc,
      'verticalSrc': instance.verticalSrc,
      'avatar': instance.avatar,
      'nickname': instance.nickname,
      'isVertical': instance.isVertical,
      'liveCity': instance.liveCity,
      'isLive': instance.isLive,
      'hn': instance.hn,
    };
