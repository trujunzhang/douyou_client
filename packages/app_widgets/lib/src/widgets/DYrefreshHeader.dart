import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


// 下拉刷新头部、底部组件                                                            
class DYrefreshHeader extends StatelessWidget with DYBase {
  @override
  Widget build(BuildContext context) {
    final refreshing = Lottie.network(
      '${DYBase.baseUrl}/static/if_refresh.json',
      height: dp(50)
    );

    return CustomHeader(
      refreshStyle: RefreshStyle.Follow,
      builder: (BuildContext context,RefreshStatus? status) {
        bool swimming = (status == RefreshStatus.refreshing || status == RefreshStatus.completed);
        return SizedBox(
          height: dp(50),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              swimming ? const SizedBox() : Image.asset(
                'assets/images/fun_home_pull_down.png',
                height: dp(50),
              ),
              Offstage(
                offstage: !swimming,
                child: refreshing,
              ),
            ]
          )
        );
      }
    );
  }
}