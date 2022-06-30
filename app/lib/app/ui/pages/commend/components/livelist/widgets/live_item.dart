import 'package:app_config/app_config.dart';
import 'package:app_rest/app_rest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class LiveItem extends StatelessWidget with DYBase {
  const LiveItem({Key? key, required this.item, required this.showKingTag})
      : super(key: key);
  final LiveDatum item;
  final bool showKingTag;

  List<Widget> _renderTag(showKingTag) {
    if (showKingTag) {
      return [
        Container(
          height: dp(18),
          decoration: const BoxDecoration(
            color: Color(0xfffcf0e2),
            borderRadius: BorderRadius.all(
              Radius.circular(9),
            ),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: dp(6),
                right: dp(6),
              ),
              child: Text(
                '皇帝推荐',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: dp(10),
                  color: const Color(0xfff7802c),
                ),
              ),
            ),
          ),
        ),
      ];
    }
    return [
      Text(
        '颜值',
        textAlign: TextAlign.start,
        style: TextStyle(
          fontSize: dp(12),
          color: const Color(0xffa2a2a2),
        ),
        strutStyle: StrutStyle(
          forceStrutHeight: true,
          fontSize: dp(13),
          height: 1,
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: dp(2)),
      ),
      Image.asset(
        'assets/images/dg.webp',
        height: dp(7),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var fontStyle = TextStyle(
      color: Colors.white,
      fontSize: dp(12),
    );
    var boxWidth = dp(164);
    var imageHeight = dp(98);
    var boxMargin = (dp(375) - boxWidth * 2) / 3 / 2;

    return GestureDetector(
      onTap: () {
        // _goToLiveRoom(context, item);
      },
      child: Padding(
        key: ObjectKey(item.rid),
        padding: EdgeInsets.only(
            left: boxMargin, right: boxMargin, bottom: boxMargin * 2),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(dp(10)),
          ),
          child: SizedBox(
            width: boxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: item.roomSrc!,
                  imageBuilder: (context, imageProvider) => Container(
                    height: imageHeight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            width: dp(120),
                            height: dp(18),
                            padding: EdgeInsets.only(right: dp(6)),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(-.4, 0.0),
                                end: Alignment(1, 0.0),
                                colors: <Color>[
                                  Color.fromRGBO(0, 0, 0, 0),
                                  Color.fromRGBO(0, 0, 0, .6),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/hot.png',
                                  height: dp(14),
                                ),
                                Padding(padding: EdgeInsets.only(right: dp(3))),
                                Text(
                                  item.hn!,
                                  style: fontStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            width: boxWidth,
                            height: dp(25),
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0, -.5),
                                end: Alignment(0, 1.3),
                                colors: <Color>[
                                  Color.fromRGBO(0, 0, 0, 0),
                                  Color.fromRGBO(0, 0, 0, .6),
                                ],
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: dp(6), top: dp(4)),
                                  child: Image.asset(
                                    'assets/images/member.png',
                                    height: dp(12),
                                  ),
                                ),
                                Padding(padding: EdgeInsets.only(right: dp(3))),
                                Text(
                                  item.nickname!,
                                  style: fontStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  placeholder: (context, url) => Image.asset(
                    'assets/images/pic-default.jpg',
                    height: imageHeight,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: dp(27),
                        child: Row(children: [
                          Container(
                            padding: EdgeInsets.only(left: dp(6), right: dp(6)),
                            width: boxWidth,
                            child: Text(
                              item.roomName!,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: dp(13),
                              ),
                            ),
                          )
                        ]),
                      ),
                      Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: dp(6.0 + 20)),
                              padding: EdgeInsets.only(left: dp(6)),
                              height: dp(18),
                              child: Row(
                                children: _renderTag(showKingTag),
                              ),
                            ),
                            Positioned(
                              right: dp(6),
                              child: Image.asset(
                                'assets/images/dg0.webp',
                                height: dp(3),
                              ),
                            )
                          ]),
                      Padding(
                          padding: EdgeInsets.only(
                        bottom: dp(7.5),
                      ))
                    ],
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
