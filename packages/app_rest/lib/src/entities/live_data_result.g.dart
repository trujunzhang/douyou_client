// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_data_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveDataResult _$LiveDataResultFromJson(Map<String, dynamic> json) =>
    LiveDataResult(
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => LiveDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      pageCount: json['pageCount'] as int?,
      nowPage: json['nowPage'] as int?,
      cate2Id: json['cate2Id'] as int?,
    );

Map<String, dynamic> _$LiveDataResultToJson(LiveDataResult instance) =>
    <String, dynamic>{
      'list': instance.list,
      'pageCount': instance.pageCount,
      'nowPage': instance.nowPage,
      'cate2Id': instance.cate2Id,
    };
