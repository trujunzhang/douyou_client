import 'package:app_widgets/app_widgets.dart';
import 'package:flutter/material.dart';

/// 头部[AnimatedBuilder]动画封装
class AnimatedHeader extends StatefulWidget {
  // final Key key;
  final Tween<double> opacityTween, heightTween;
  final Function cb;

  const AnimatedHeader({
    Key? key,
    required this.opacityTween,
    required this.heightTween,
    required this.cb,
  }) : super(key: key);

  @override
  _AnimatedHeader createState() => _AnimatedHeader();
}

class _AnimatedHeader extends State<AnimatedHeader>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.cb();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext ctx, Widget? child) {
        return DyHeader(
          height: widget.heightTween.evaluate(animation),
          opacity: widget.opacityTween.evaluate(animation),
        );
      },
    );
  }
}
