import 'package:json_annotation/json_annotation.dart';

import '../entities/live_data_result.dart';

part 'live_data_response.g.dart';

@JsonSerializable()
class LiveDataResponse {
  int? code;
  LiveDataResult? data;

  LiveDataResponse({this.code, this.data});

  factory LiveDataResponse.fromJson(Map<String, dynamic> json) {
    return _$LiveDataResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LiveDataResponseToJson(this);
}
