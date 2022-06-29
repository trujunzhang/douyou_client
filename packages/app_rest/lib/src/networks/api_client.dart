import 'package:app_config/app_config.dart';
import 'package:app_rest/src/entities/index.dart';
import 'package:app_rest/src/response/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: AppConfigs.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///User
  // @POST("/login")
  // Future<TokenEntity> authLogin(@Body() Map<String, dynamic> body);

  @POST("/logout")
  Future<dynamic> signOut(@Body() Map<String, dynamic> body);

  /// Notification
  // @GET("/notifications")
  // Future<ArrayResponse<NotificationEntity>> getNotifications(
  //   @Query('page') int page,
  //   @Query('pageSize') int pageSize,
  // );

  /// nav
  @GET("/dy/flutter/nav")
  Future<BaseResultResponse<String>> getNav();

  /// swiper
  @GET("/dy/flutter/swiper")
  Future<BaseResultResponse<String>> getSwiper();

  /// broadcast
  @GET("/dy/flutter/broadcast")
  Future<BaseResultResponse<BroadCast>> getBroadcast();

  /// liveData
  @GET("/dy/flutter/liveData")
  Future<LiveDataResponse> getLiveData({@Query('page') int page = 0});

  /// lotteryConfig
  @GET("/dy/flutter/lotteryConfig")
  Future<LotteryConfigResponse> getLotteryConfig();

  /// lotteryResult
  @GET("/dy/flutter/lotteryResult")
  Future<LotteryResultResponse> getLotteryResult();

  /// yubaList
  @GET("/dy/flutter/yubaList")
  Future<BaseResultResponse<Yuba>> getYubaList({@Query('page') int page = 0});

  /// areaTel
  @GET("/static/areaTel.json")
  Future<AreaTel> getAreaTel();
}
