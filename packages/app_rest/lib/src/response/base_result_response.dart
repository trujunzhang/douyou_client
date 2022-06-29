import 'package:json_annotation/json_annotation.dart';

part 'base_result_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResultResponse<T> {
  int? error;
  String? msg;
  List<T>? data;

  BaseResultResponse({this.error, this.msg, this.data});

  // factory BaseResultResponse.fromJson(Map<String, dynamic> json) {
  //   return _$BaseResultResponseFromJson(json);
  // }

  // Map<String, dynamic> toJson() => _$BaseResultResponseToJson(this);

  factory BaseResultResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResultResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResultResponseToJson(this, toJsonT);
}
