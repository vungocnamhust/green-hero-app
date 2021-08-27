import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PercentageCircularIndicator extends StatefulWidget {
  final double percentage;
  final double size;
  final double strokeWidth;
  final Duration customDuration;
  PercentageCircularIndicator(
    double percentage, {
    this.size = CIRCULAR_SIZE,
    this.strokeWidth = CIRCULAR_STROKE_WIDTH,
    this.customDuration,
  }) : this.percentage = min(max(percentage ?? 0, 0.00001), 100);

  static const double CIRCULAR_SIZE = 100.0;
  static const double CIRCULAR_STROKE_WIDTH = 12.0;

  @override
  _PercentageCircularIndicatorState createState() => _PercentageCircularIndicatorState();
}

class _PercentageCircularIndicatorState extends State<PercentageCircularIndicator> with TickerProviderStateMixin {
  AnimationController animationController;

  double get indicatorValue => widget.percentage / 100;

  void initAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: widget.customDuration ?? Duration(milliseconds: (indicatorValue * 1200).toInt()),
      lowerBound: 0.0,
      upperBound: indicatorValue,
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    initAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PercentageCircularIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    animationController.reset();
    initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          Color startColor, endColor;
          final double value = animationController.value;
          double colorValue;
          if (0 <= value && value <= 0.2) {
            startColor = Colors.red[900];
            endColor = Colors.red;
            colorValue = value / 0.2;
          } else if (value <= 0.4) {
            startColor = Colors.red;
            endColor = Colors.orange[700];
            colorValue = (value - 0.2) / 0.2;
          } else if (value <= 0.6) {
            startColor = Colors.orange[700];
            endColor = Colors.yellow[700];
            colorValue = (value - 0.4) / 0.2;
          } else if (value <= 0.8) {
            startColor = Colors.yellow[700];
            endColor = Colors.green[400];
            colorValue = (value - 0.6) / 0.2;
          } else {
            startColor = Colors.green[400];
            endColor = Colors.green[700];
            colorValue = (value - 0.8) / 0.2;
          }
          final Color percentageColor = Color.lerp(startColor, endColor, colorValue);
          return Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: widget.size,
                height: widget.size,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[300],
                  strokeWidth: widget.strokeWidth,
                  value: animationController.value,
                  valueColor: AlwaysStoppedAnimation<Color>(percentageColor),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(widget.strokeWidth * 1.2),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    (animationController.value * 100).toInt().toString() + ' %',
                    style: Get.textTheme.headline4.copyWith(
                      height: 1.15,
                      color: percentageColor,
                      shadows: [
                        Shadow(
                          color: Colors.grey[300],
                          offset: Offset(1, 2),
                          blurRadius: 2,
                        ),
                        Shadow(
                          color: Colors.grey[300],
                          offset: Offset(-1, 0),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class TestPercentageCircularIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PercentageCircularIndicator(0),
            const SizedBox(height: 30),
            PercentageCircularIndicator(100),
          ],
        ),
      ),
    );
  }
}
