import 'package:json_annotation/json_annotation.dart';

part 'yuba.g.dart';

@JsonSerializable()
class Yuba {
  String? id;
  String? name;
  String? avatar;
  int? sex;
  int? level;
  int? time;
  int? read;
  String? title;
  String? content;
  List<String>? pic;
  int? hot;
  List<dynamic>? discuss;
  String? anchor;
  int? share;
  int? chat;
  int? agree;
  bool? isAgree;

  Yuba({
    this.id,
    this.name,
    this.avatar,
    this.sex,
    this.level,
    this.time,
    this.read,
    this.title,
    this.content,
    this.pic,
    this.hot,
    this.discuss,
    this.anchor,
    this.share,
    this.chat,
    this.agree,
    this.isAgree,
  });

  factory Yuba.fromJson(Map<String, dynamic> json) => _$YubaFromJson(json);

  Map<String, dynamic> toJson() => _$YubaToJson(this);
}
