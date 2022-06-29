/*
 * @discripe: 登录弹窗弹窗
 */
import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';


class LoginDialog extends Dialog with DYBase {
  LoginDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: dp(320),
            height: dp(430),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            child: OverflowBox(
              alignment: Alignment.bottomCenter,
              maxHeight: dp(515),
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  Positioned(
                    child: Image.asset(
                      'assets/images/login/syn.webp',
                      width: dp(220),
                    ),
                  ),
                  Positioned(
                    top: dp(170),
                    left: dp(30),
                    child: const Text('登录',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Positioned(
                    top: dp(100),
                    right: dp(15),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                        child: Image.asset('assets/images/login/close.webp',
                        width: dp(15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: dp(30),
                      right: dp(30),
                      top: dp(230),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        RawMaterialButton (
                          fillColor: DYBase.defaultColor,
                          elevation: 0,
                          highlightElevation: 0,
                          highlightColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pushNamed(context, '/login', arguments: {
                              'type': 'signin'
                            });
                          },
                          child: Container(
                            height: dp(50),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(dp(4))),
                            ),
                            child: const Center(
                              child: Text('斗鱼账号登录',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: dp(20), bottom: dp(15)),
                          child: RawMaterialButton (
                            fillColor: Colors.white,
                            elevation: 0,
                            highlightElevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushNamed(context, '/login', arguments: {
                                'type': 'signup'
                              });
                            },
                            child: Container(
                              height: dp(50),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(4)),
                                border: Border.all(width: dp(1), color: const Color(0xffffcac4)),
                              ),
                              child: const Center(
                                child: Text('快速注册',
                                  style: TextStyle(
                                    color: Color(0xffff5038),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              color: Color(0xff999999),
                              fontSize: 12,
                              height: 1.2,
                            ),
                            children: [
                              TextSpan(
                                text: '使用即为同意',
                              ),
                              TextSpan(
                                text: '《隐私权政策》',
                                style: TextStyle(
                                  color: Color(0xffff7701)
                                ),
                              ),
                              TextSpan(
                                text: '、',
                              ),
                              TextSpan(
                                text: '《用户注册协议》',
                                style: TextStyle(
                                  color: Color(0xffff7701)
                                ),
                              ),
                              TextSpan(
                                text: '和',
                              ),
                              TextSpan(
                                text: '《用户阳光行为准则》',
                                style: TextStyle(
                                  color: Color(0xffff7701)
                                ),
                              ),
                            ],
                          ),       
                        ),
                        SizedBox(
                          height: dp(65),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: dp(25)),
                                height: dp(2),
                                width: dp(40),
                                color: const Color(0xffe7e7e7),
                              ),
                              const Text('快速登录',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff707070,)
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: dp(25)),
                                height: dp(2),
                                width: dp(40),
                                color: const Color(0xffe7e7e7),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Image.asset('assets/images/login/wx.webp',
                              width: dp(30),
                            ),
                            Image.asset('assets/images/login/qq.webp',
                              width: dp(30),
                            ),
                            Image.asset('assets/images/login/weibo.webp',
                              width: dp(30),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}