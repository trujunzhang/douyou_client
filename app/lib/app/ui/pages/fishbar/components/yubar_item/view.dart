import 'dart:async';
import 'dart:ui' as ui;

import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';

import 'index.dart';

class YubaItem extends StatefulWidget {
  const YubaItem({Key? key, required this.item, required this.index})
      : super(key: key);
  final Yuba item;
  final int index;

  @override
  _YubaItemState createState() => _YubaItemState();
}

class _YubaItemState extends State<YubaItem> with DYBase {
  YubaItemController controller =
      Get.put<YubaItemController>(YubaItemController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Obx(() => _buildBody(context));
    return _buildBody(context);
  }

  // 根据数量动态计算图片宽高（类似微信朋友圈）
  Widget _picUnknownNum(BuildContext context, List<String> pic,
      {required String id}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxMargin = dp(60);
    double picPadding = dp(5);

    return Wrap(
      children: pic
          .asMap()
          .map(
            (i, item) {
              String tag = id + i.toString();
              Map<String, double> imageSize = {};
              // 1张图：宽高自适应
              if (pic.length == 1) {
                imageSize['paddingRight'] = 0;
                Image image = Image.network(item);
                Completer<ui.Image> completer = Completer<ui.Image>();
                image.image
                    .resolve(const ImageConfiguration())
                    .addListener(ImageStreamListener((ImageInfo info, bool _) {
                  completer.complete(info.image);
                }));

                return MapEntry(
                  i,
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: picPadding, right: imageSize['paddingRight']!),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(dp(10)),
                      ),
                      child: FutureBuilder<ui.Image>(
                        future: completer.future,
                        builder: (BuildContext context,
                            AsyncSnapshot<ui.Image> snapshot) {
                          if (snapshot.hasData) {
                            double maxWidth =
                                (screenWidth - boxMargin - picPadding) * .7;
                            double maxHeight =
                                (screenWidth - boxMargin - picPadding) / 2;
                            int imgWidth = snapshot.data!.width;
                            int imgHeight = snapshot.data!.height;

                            if (imgWidth >= imgHeight) {
                              imageSize['width'] = maxWidth;
                              if (imgHeight < imgWidth / 2) {
                                imageSize['height'] = maxWidth / 2;
                              }
                              // imageSize['height'] = (imgHeight < imgWidth / 2
                              //     ? maxWidth / 2
                              //     : null)!;
                            } else {
                              imageSize['height'] = maxHeight;
                              if (imgWidth < imgHeight / 2) {
                                imageSize['width'] = maxHeight / 2;
                              }
                              // imageSize['width'] = (imgWidth < imgHeight / 2
                              //     ? maxHeight / 2
                              //     : null)!;
                            }
                            return GestureDetector(
                              onTap: () {
                                controller.showPhotoGallery(context, pic,
                                    tag: tag);
                              },
                              child: Hero(
                                tag: tag,
                                child: Image.network(
                                  item,
                                  height: imageSize['height'],
                                  width: imageSize['width'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ),
                );
                // 2、4张图：宽高正方形，单行80%各占一半
              } else if (pic.length == 2 || pic.length == 4) {
                if (pic.length == 4) {
                  imageSize['width'] =
                      ((screenWidth - boxMargin - picPadding) / 2.5)
                          .floor()
                          .toDouble();
                } else {
                  imageSize['width'] =
                      ((screenWidth - boxMargin - picPadding) / 2)
                          .floor()
                          .toDouble();
                }
                imageSize['height'] = imageSize['width']!;
                imageSize['paddingRight'] = (i + 1) % 2 == 0 ? .0 : picPadding;
                // 3、5~9张图：宽高正方形，单行三张流式，九宫格
              } else {
                imageSize['width'] =
                    ((screenWidth - boxMargin - picPadding * 2) / 3)
                        .floor()
                        .toDouble();
                imageSize['height'] = imageSize['width']!;
                imageSize['paddingRight'] = (i + 1) % 3 == 0 ? .0 : picPadding;
              }

              return MapEntry(
                i,
                Padding(
                  padding: EdgeInsets.only(
                      bottom: picPadding, right: imageSize['paddingRight']!),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(dp(10)),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        controller.showPhotoGallery(context, pic,
                            index: i, tag: tag);
                      },
                      child: Hero(
                        tag: tag,
                        child: Image.network(
                          item,
                          height: imageSize['height'],
                          width: imageSize['width'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
          .values
          .toList(),
    );
  }

  Widget _buildBody(BuildContext context) {
    int index = widget.index;
    Yuba item = widget.item;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xfff9f9f9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(dp(15)),
              topRight: Radius.circular(dp(15)),
            ),
          ),
          height: dp(40),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              index <= 2
                  ? Positioned(
                      left: dp(10),
                      bottom: dp(13),
                      child: Container(
                        width: dp(20),
                        height: dp(5),
                        color: const Color(0xffff5d24),
                      ),
                    )
                  : const SizedBox(),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: dp(10)),
                  ),
                  Text(
                    index <= 2 ? 'TOP.${index + 1}' : 'NO.${index + 1}',
                    style: TextStyle(
                      color: const Color(0xff333333),
                      fontSize: dp(18),
                      fontWeight: FontWeight.bold,
                      letterSpacing: dp(2.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          margin: EdgeInsets.only(bottom: dp(15)),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(dp(15)),
              bottomRight: Radius.circular(dp(15)),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: controller.showCardOption,
                      child: Container(
                        width: dp(20),
                        height: dp(20),
                        color: Colors.transparent,
                        child: Center(
                          child: Image.asset(
                            'assets/images/bar/pull-icon.webp',
                            width: dp(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(dp(20)),
                        ),
                        child: Image.network(
                          item.avatar!,
                          width: dp(40),
                          height: dp(40),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: dp(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            SizedBox(
                              width: dp(180.0 + 17 + 14),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    item.name!,
                                    style: const TextStyle(
                                      color: Color(0xff666666),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: dp(4)),
                                  ),
                                  Image.asset(
                                    item.sex == 0
                                        ? 'assets/images/bar/girl.webp'
                                        : 'assets/images/bar/boy.webp',
                                    height: dp(17),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: dp(4)),
                                  ),
                                  Image.asset(
                                    'assets/images/lv/${item.level}.png',
                                    height: dp(14),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  DYservice.formatTime(item.time!),
                                  style: const TextStyle(
                                      color: Color(0xff999999), fontSize: 12),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: dp(10)),
                                ),
                                Text(
                                  '${DYservice.formatNum(item.read!)}阅读',
                                  style: const TextStyle(
                                      color: Color(0xff999999), fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: dp(10)),
                child: Text(
                  item.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: Color(0xff333333), fontSize: 15.5, height: 1.2),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: dp(4)),
                child: Text(
                  item.content!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xff999999), height: 1.1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: dp(10)),
                child: _picUnknownNum(context, item.pic!, id: item.id!),
              ),
              Padding(
                padding: EdgeInsets.only(top: dp(10), bottom: dp(10)),
                child: Container(
                  padding: EdgeInsets.all(dp(10)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(dp(10)),
                    ),
                    color: const Color(0xfff8f8f8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/bar/hot-chat.jpg',
                            height: dp(18),
                          ),
                          Text(
                            '${DYservice.formatNum(item.hot!)}赞',
                            style: const TextStyle(
                              color: Color(0xffcccccc),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: dp(5)),
                      ),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                              color: Color(0xff666666),
                              fontSize: 14,
                              height: 1.3),
                          children: [
                            TextSpan(
                              text: '醉音符：',
                              style: TextStyle(color: Color(0xff5f84b0)),
                            ),
                            TextSpan(
                              text: '小姐姐终于开播了，火车开起来！',
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(
                              color: Color(0xff666666),
                              fontSize: 14,
                              height: 1.3),
                          children: [
                            TextSpan(
                              text: '小流仔丶QAQ',
                              style: TextStyle(color: Color(0xff5f84b0)),
                            ),
                            TextSpan(
                              text: ' 回复 ',
                            ),
                            TextSpan(
                              text: '醉音符：',
                              style: TextStyle(color: Color(0xff5f84b0)),
                            ),
                            TextSpan(
                              text: '你怎么像个魔教中人？',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: dp(10),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: dp(110),
                      child: Wrap(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                              left: dp(10),
                              right: dp(10),
                              top: dp(7),
                              bottom: dp(7),
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xfff8f8f8),
                              borderRadius: BorderRadius.all(
                                Radius.circular(dp(15)),
                              ),
                            ),
                            child: Text(
                              item.anchor!,
                              style: const TextStyle(
                                color: Color(0xff999999),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/bar/chat-share.jpg',
                          height: dp(18),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: dp(4), right: dp(6)),
                          child: Text(
                            DYservice.formatNum(item.share!),
                            style: const TextStyle(
                              color: Color(0xff999999),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/bar/chat-add.jpg',
                          height: dp(18),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: dp(4), right: dp(6)),
                          child: Text(
                            DYservice.formatNum(item.chat!),
                            style: const TextStyle(
                              color: Color(0xff999999),
                            ),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.starNews(index);
                      },
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            item.isAgree!
                                ? 'assets/images/bar/chat-star-act.webp'
                                : 'assets/images/bar/chat-star.jpg',
                            height: dp(18),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: dp(4),
                            ),
                            child: Text(
                              DYservice.formatNum(item.agree!),
                              style: TextStyle(
                                color: item.isAgree!
                                    ? DYBase.defaultColor
                                    : const Color(0xff999999),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<YubaItemController>();
    super.dispose();
  }
}
