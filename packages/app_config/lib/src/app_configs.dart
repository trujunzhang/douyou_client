import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppConfigs {
  static const String appName = 'Real Agent';

  static const double appbarHeight = 156.0;

  ///DEV

  ///STAGING
  static const envName = "Staging";
  static const webUrl = "https://www.themoviedb.org";
  static const baseUrl = 'http://23.105.205.158:1236';
  static const socketUrl = 'wss://socket.themoviedb.org'; //Todo: change this

  ///PRODUCTION

  ///Paging
  static const pageSize = 20;
  static const pageSizeMax = 1000;

  ///DateFormat

  static const dateAPIFormat = 'dd/MM/yyyy';
  static const dateDisplayFormat = 'dd/MM/yyyy';

  static const dateTimeAPIFormat = "MM/dd/yyyy'T'hh:mm:ss.SSSZ"; //Use DateTime.parse(date) instead of ...
  static const dateTimeDisplayFormat = 'dd/MM/yyyy HH:mm';

  ///Date range
  static final identityMinDate = DateTime(1900, 1, 1);
  static final identityMaxDate = DateTime.now();
  static final birthMinDate = DateTime(1900, 1, 1);
  static final birthMaxDate = DateTime.now();

  ///Max file
  static const maxAttachFile = 5;
}

class SentryConfig {
  static const dsn = '';
}

class DatabaseConfig {
  //Todo
  static const int version = 1;
}

class UpGraderAPIConfig {
  static const String APIKey = '';
}

// 所有Widget继承的抽象类
abstract class DYBase {
  static const baseSchema = 'http';
  // static final baseHost = '192.168.97.142';
  static const baseHost = '23.105.205.158';
  static const basePort = '1236';
  static const baseUrl = '${DYBase.baseSchema}://${DYBase.baseHost}:${DYBase.basePort}';
  // 默认斗鱼主题色
  static const defaultColor = Color(0xffff5d23);
  // 初始化设计稿尺寸
  static const double dessignWidth = 375.0;
  static const double dessignHeight = 1335.0;

  static final double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;

  // flutter_screenutil px转dp
  // double dp(double dessignValue) => ScreenUtil().setWidth(dessignValue);
  double dp(double dessignValue) => (dessignValue);
}