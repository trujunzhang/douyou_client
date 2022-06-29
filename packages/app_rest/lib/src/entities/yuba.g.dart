// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yuba.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Yuba _$YubaFromJson(Map<String, dynamic> json) => Yuba(
      id: json['id'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      sex: json['sex'] as int?,
      level: json['level'] as int?,
      time: json['time'] as int?,
      read: json['read'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      pic: (json['pic'] as List<dynamic>?)?.map((e) => e as String).toList(),
      hot: json['hot'] as int?,
      discuss: json['discuss'] as List<dynamic>?,
      anchor: json['anchor'] as String?,
      share: json['share'] as int?,
      chat: json['chat'] as int?,
      agree: json['agree'] as int?,
      isAgree: json['isAgree'] as bool?,
    );

Map<String, dynamic> _$YubaToJson(Yuba instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'sex': instance.sex,
      'level': instance.level,
      'time': instance.time,
      'read': instance.read,
      'title': instance.title,
      'content': instance.content,
      'pic': instance.pic,
      'hot': instance.hot,
      'discuss': instance.discuss,
      'anchor': instance.anchor,
      'share': instance.share,
      'chat': instance.chat,
      'agree': instance.agree,
      'isAgree': instance.isAgree,
    };
