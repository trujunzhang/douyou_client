/*
 * @discripe: app通用头部组件
 */
import 'dart:ui';
import 'dart:io';

import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';

import 'DYdialog.dart';
// import 'package:barcode_scan/barcode_scan.dart';
// import 'package:flutter/services.dart';

class DyHeader extends StatefulWidget {
  final double? height;
  final double opacity;
  final BoxDecoration? decoration;

  const DyHeader({Key? key, this.height, this.opacity = 1.0, this.decoration})
      : super(key: key);

  @override
  _DyHeader createState() => _DyHeader();
}

class _DyHeader extends State<DyHeader> with DYBase {
  final TextEditingController _search = TextEditingController();
  // ScanResult _scanResult;

  Future _scan() async {
    // try {
    //   _scanResult = await BarcodeScanner.scan();
    //   if (_scanResult.rawContent != '') {
    //     _search.text = _scanResult.rawContent;
    //   }
    // } on PlatformException catch (e) {
    //   if (e.code == BarcodeScanner.cameraAccessDenied) {
    //     DYdialog.alert(context, text: '设备未获得权限');
    //   } else {
    //     DYdialog.alert(context, text: '未捕获的错误: $e');
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: widget.height ?? DYBase.statusBarHeight + dp(55),
      width: screenWidth,
      decoration: widget.decoration ??
          const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xffff8633),
                Color(0xffff6634),
              ],
            ),
          ),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Positioned(
            bottom: dp(10),
            child: Opacity(
              opacity: widget.opacity,
              child: SizedBox(
                width: screenWidth - dp(30),
                height: dp(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(dp(20)),
                      ),
                      child: GestureDetector(
                        onTap: () => DYdialog.showLogin(context),
                        child: Image.asset(
                          'assets/images/default-avatar.webp',
                          width: dp(40),
                          height: dp(40),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: dp(35),
                        margin: EdgeInsets.only(left: dp(15)),
                        padding: EdgeInsets.only(left: dp(5), right: dp(5)),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(dp(35 / 2)),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            // 搜索ICON
                            Image.asset(
                              'assets/images/head/search.webp',
                              width: dp(25),
                              height: dp(15),
                            ),
                            // 搜索输入框
                            Expanded(
                              flex: 1,
                              child: TextField(
                                controller: _search,
                                cursorColor: DYBase.defaultColor,
                                cursorWidth: 1.5,
                                style: const TextStyle(
                                  color: DYBase.defaultColor,
                                  fontSize: 14.0,
                                ),
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  contentPadding: EdgeInsets.all(0),
                                  hintText: '搜你喜欢的主播吧～',
                                ),
                              ),
                            ),
                            Platform.isAndroid
                                ? GestureDetector(
                                    onTap: _scan,
                                    child: Image.asset(
                                      'assets/images/head/camera.webp',
                                      width: dp(20),
                                      height: dp(15),
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: dp(10)),
                      child: Image.asset(
                        'assets/images/head/history.webp',
                        width: dp(25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: dp(10)),
                      child: Image.asset(
                        'assets/images/head/game.webp',
                        width: dp(25),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: dp(10)),
                      child: Image.asset(
                        'assets/images/head/chat.webp',
                        width: dp(25),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
