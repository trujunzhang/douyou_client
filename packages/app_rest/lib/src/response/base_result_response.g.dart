// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResultResponse<T> _$BaseResultResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResultResponse<T>(
      error: json['error'] as int?,
      msg: json['msg'] as String?,
      data: (json['data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );

Map<String, dynamic> _$BaseResultResponseToJson<T>(
  BaseResultResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'error': instance.error,
      'msg': instance.msg,
      'data': instance.data?.map(toJsonT).toList(),
    };
