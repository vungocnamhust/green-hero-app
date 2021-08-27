import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_vietnamese/core/Constant/COLOR_CONST.dart';
import 'package:learning_vietnamese/core/util/logging.dart';

class ScrollableOverlayWidget extends StatefulWidget {
  final Widget child;
  const ScrollableOverlayWidget({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _ScrollableOverlayWidgetState createState() => _ScrollableOverlayWidgetState();
}

class _ScrollableOverlayWidgetState extends State<ScrollableOverlayWidget> with SingleTickerProviderStateMixin {
  ScrollController scrollController;
  StreamController<double> streamScrollOffset = StreamController<double>.broadcast();
  double availableHeight;

  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 10,
      upperBound: 15,
    )..repeat(reverse: true);

    scrollController = ScrollController();
    scrollController.addListener(() {
      if (!scrollController.hasClients) return;
      if (scrollController.offset >= availableHeight) {
        animationController.stop();
        animationController.reset();
      } else if (!animationController.isAnimating) {
        animationController.repeat(reverse: true);
      }
      streamScrollOffset.sink.add(scrollController.offset);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      availableHeight = scrollController.position.maxScrollExtent;
      logging(scrollController.position.maxScrollExtent, name: 'MAX SCROLL');
      streamScrollOffset.sink.add(scrollController.offset);
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    scrollController.dispose();
    streamScrollOffset.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        logging(constraints.maxHeight, name: 'MAX HEIGHT');
        if (!scrollController.hasClients) availableHeight = constraints.maxHeight;
        final double maxWidth = constraints.maxWidth;
        final double maxHeight = constraints.maxHeight;
        return Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                controller: scrollController,
                child: widget.child,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: maxWidth,
                height: maxHeight / 7,
                child: overlayTop(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: maxWidth,
                height: maxHeight / 7,
                child: overlayBottom(),
              ),
            ),
            buildCanScrollArrow(),
          ],
        );
      },
    );
  }

  Widget overlayTop() {
    return StreamBuilder<double>(
      stream: streamScrollOffset.stream,
      initialData: 0,
      builder: (context, snapshot) {
        final double offset = snapshot.data;
        if (offset <= 0) return SizedBox.shrink();
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [
                Colors.white,
                Colors.transparent,
              ],
              stops: [0.0, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstATop,
          child: _overlayWidget(),
        );
      },
    );
  }

  Widget overlayBottom() {
    return StreamBuilder<double>(
      stream: streamScrollOffset.stream,
      initialData: 0,
      builder: (context, snapshot) {
        final double offset = snapshot.data;
        if (offset >= availableHeight) return SizedBox.shrink();
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [
                Colors.white,
                Colors.transparent,
              ],
              stops: [0.0, 1.0],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ).createShader(bounds);
          },
          blendMode: BlendMode.dstATop,
          child: _overlayWidget(),
        );
      },
    );
  }

  Widget _overlayWidget() {
    return Container(color: COLOR_CONST.light_learn_background);
  }

  Widget buildCanScrollArrow() {
    return StreamBuilder<double>(
      stream: streamScrollOffset.stream,
      initialData: 0,
      builder: (context, snapshot) {
        final bool reachBottom = snapshot.data >= availableHeight;
        return AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, -animationController.value),
              child: Visibility(
                visible: !reachBottom,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 50,
                    color: Get.theme.accentColor,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
