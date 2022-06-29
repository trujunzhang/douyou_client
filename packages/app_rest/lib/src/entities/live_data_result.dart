import 'package:json_annotation/json_annotation.dart';

import 'live_datum.dart';

part 'live_data_result.g.dart';

@JsonSerializable()
class LiveDataResult {
  List<LiveDatum>? list;
  int? pageCount;
  int? nowPage;
  int? cate2Id;

  LiveDataResult({
    this.list,
    this.pageCount,
    this.nowPage,
    this.cate2Id,
  });

  factory LiveDataResult.fromJson(Map<String, dynamic> json) {
    return _$LiveDataResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LiveDataResultToJson(this);
}
