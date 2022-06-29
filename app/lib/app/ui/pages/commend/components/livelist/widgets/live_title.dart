import 'dart:math';

import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';
import 'package:flutter/material.dart';

final _random = Random();

int next(int min, int max) => min + _random.nextInt(max - min);
final int _baseLiveNum = next(1e3.round() + 1, 1e4.round());

class LiveTitle extends StatelessWidget with DYBase {
  const LiveTitle({Key? key, required this.liveList}) : super(key: key);
  final List<LiveDatum> liveList;

  Iterable<Widget> _numberList() {
    int liveDataLen = liveList.length + _baseLiveNum;
    String liveDataLenStr = liveDataLen.toString();
    return liveDataLenStr.split('').map((number) => Image.asset(
          'assets/images/num/$number.webp',
          height: dp(13),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // 直播列表头部
    var numberList = _numberList();
    return Container(
      height: dp(52),
      margin: EdgeInsets.only(
        left: dp(15),
        right: dp(15),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: dp(25),
            margin: EdgeInsets.only(right: dp(5)),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/cqe.webp'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Expanded(
            child: Text(
              '猜你喜欢',
              style: TextStyle(
                  color: const Color(0xff333333),
                  fontSize: dp(18),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: dp(1.5)),
                child: Text(
                  '当前',
                  style: TextStyle(
                    color: const Color(0xfff8632e),
                    fontSize: dp(13),
                  ),
                ),
              ),
              ...numberList,
              Padding(
                padding: EdgeInsets.only(left: dp(1.5)),
                child: Text(
                  '位主播',
                  style: TextStyle(
                    color: const Color(0xfff8632e),
                    fontSize: dp(13),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: dp(5)),
                child: Image.asset(
                  'assets/images/cfk.webp',
                  height: dp(14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
