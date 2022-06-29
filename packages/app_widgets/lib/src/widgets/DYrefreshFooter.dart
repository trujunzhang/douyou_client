import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DYrefreshFooter extends StatelessWidget with DYBase {
  final bgColor;
  DYrefreshFooter({this.bgColor});

  @override
  Widget build(BuildContext context) {
    final height = dp(50);

    return CustomFooter(
      height: height,
      builder: (BuildContext context, LoadStatus? mode) {
        final textStyle = TextStyle(
          color: const Color(0xffA7A7A7),
          fontSize: dp(13),
        );
        Widget body;
        Widget loading = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network('${DYBase.baseUrl}/static/loading.json',
                height: dp(34)),
            Text(
              '用力加载中...',
              style: textStyle,
            ),
          ],
        );
        if (mode == LoadStatus.idle) {
          body = loading;
        } else if (mode == LoadStatus.loading) {
          body = loading;
        } else if (mode == LoadStatus.failed) {
          body = Text(
            '网络出错啦 😭',
            style: textStyle,
          );
        } else if (mode == LoadStatus.canLoading) {
          body = loading;
        } else {
          body = Text(
            '我是有底线的 😭',
            style: textStyle,
          );
        }
        return Container(
          color: bgColor,
          height: height,
          child: Center(child: body),
        );
      },
    );
  }
}
