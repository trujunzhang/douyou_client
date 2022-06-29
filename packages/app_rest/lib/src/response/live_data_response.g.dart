// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveDataResponse _$LiveDataResponseFromJson(Map<String, dynamic> json) =>
    LiveDataResponse(
      code: json['code'] as int?,
      data: json['data'] == null
          ? null
          : LiveDataResult.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LiveDataResponseToJson(LiveDataResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
