import 'package:json_annotation/json_annotation.dart';

part 'live_datum.g.dart';

@JsonSerializable()
class LiveDatum {
  int? rid;
  int? vipId;
  String? roomName;
  int? cate1Id;
  int? cate2Id;
  String? roomSrc;
  String? verticalSrc;
  String? avatar;
  String? nickname;
  int? isVertical;
  String? liveCity;
  int? isLive;
  String? hn;

  LiveDatum({
    this.rid,
    this.vipId,
    this.roomName,
    this.cate1Id,
    this.cate2Id,
    this.roomSrc,
    this.verticalSrc,
    this.avatar,
    this.nickname,
    this.isVertical,
    this.liveCity,
    this.isLive,
    this.hn,
  });

  factory LiveDatum.fromJson(Map<String, dynamic> json) {
    return _$LiveDatumFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LiveDatumToJson(this);
}
