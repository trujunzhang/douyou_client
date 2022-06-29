/*
 * @discripe: laoding弹窗
 */
import 'package:app_config/app_config.dart';
import 'package:flutter/material.dart';


class LoadingDialog extends Dialog with DYBase {
  final String text;

  LoadingDialog({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: dp(120),
          height: dp(120),
          child: Container(
            decoration: const ShapeDecoration(
              color: Color(0xffffffff),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircularProgressIndicator(),
                Padding(
                  padding: EdgeInsets.only(
                    top: dp(20),
                  ),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 12.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}