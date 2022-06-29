import 'package:json_annotation/json_annotation.dart';

part 'broad_cast.g.dart';

@JsonSerializable()
class BroadCast {
  String? title;
  int? time;
  int? num;
  bool? order;

  BroadCast({this.title, this.time, this.num, this.order});

  factory BroadCast.fromJson(Map<String, dynamic> json) {
    return _$BroadCastFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BroadCastToJson(this);
}
