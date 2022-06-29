import 'package:app_config/app_config.dart';
import 'package:app_widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_language/langs/l10n.dart';
import 'package:my_plugin/my_plugin.dart';

import 'index.dart';

class CateList extends StatefulWidget {
  const CateList({Key? key}) : super(key: key);

  @override
  _CateListState createState() => _CateListState();
}

class _CateListState extends State<CateList> with DYBase {
  CateListController controller =
      Get.put<CateListController>(CateListController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _buildBody(context));
    // return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    var tabRender = controller.tab
        .asMap()
        .keys
        .map((index) => InkWell(
              onTap: () => DYdialog.alert(context,
                  title: controller.tab[index],
                  text: '年轻人不讲武德，偷袭！🪓\n我还没上线呢...',
                  yes: '😭 好的，下次一定'),
              child: Container(
                width: dp(375 / 5),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/cate/tab-${index.toString()}.webp',
                      height: dp(40),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: dp(7)),
                    ),
                    Text(
                      controller.tab[index],
                      style: TextStyle(
                        color: const Color(0xff888888),
                        fontSize: dp(13.5),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        .toList();

    double indicatorBoxWidth = dp(34);
    double indicatorHeight = dp(3.5);
    double indicatorWidth = dp(15);
    double scrollValue = controller.state.scrollRatio.value *
        (indicatorBoxWidth - indicatorWidth);

    return Column(
      children: [
        SizedBox(
          height: dp(80),
          child: NotificationListener(
            onNotification: (ScrollNotification note) {
              // setState(() {
              controller.state.scrollRatio.value =
                  note.metrics.pixels / note.metrics.maxScrollExtent;
              // });
              return true;
            },
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(0),
              children: tabRender,
            ),
          ),
        ),
        SizedBox(
          height: dp(18),
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(indicatorHeight / 2),
              ),
              child: Container(
                width: indicatorBoxWidth,
                height: indicatorHeight,
                color: const Color(0xffd0d0d0),
                child: Stack(alignment: Alignment.centerLeft, children: [
                  Positioned(
                    left: scrollValue,
                    child: Container(
                      width: indicatorWidth,
                      height: indicatorHeight,
                      color: const Color(0xffff5d24),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: dp(6)),
        )
      ],
    );
  }

  @override
  void dispose() {
    Get.delete<CateListController>();
    super.dispose();
  }
}
