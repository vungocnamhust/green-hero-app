import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetLoadingGif extends StatelessWidget {
  final String text;
  WidgetLoadingGif({
    this.text = 'Vui lòng đợi một xíu...',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            //   'lib/assets/walking.gif',
            //   fit: BoxFit.contain,
            //   height: 300,
            // ),
            const SizedBox(height: 10),
            SpinningImage(),
            const SizedBox(height: 10),
            Text(
              this.text,
              textAlign: TextAlign.center,
              style: Get.textTheme.headline5.copyWith(
                color: Get.theme.accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SpinningImage extends StatefulWidget {
  final double size;
  const SpinningImage({
    Key key,
    double size,
  })  : this.size = size ?? 240,
        super(key: key);

  @override
  _SpinningImageState createState() => _SpinningImageState();
}

class _SpinningImageState extends State<SpinningImage> with SingleTickerProviderStateMixin {
  AnimationController spinningController;
  Animation spinningAnimation;

  @override
  void initState() {
    super.initState();
    spinningController = AnimationController(
      duration: const Duration(milliseconds: 8000),
      vsync: this,
    );
    spinningAnimation = Tween(begin: 0.0, end: 1.0).animate(spinningController);
    spinningController.repeat();
  }

  @override
  void dispose() {
    spinningController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: spinningAnimation,
      child: ClipOval(
        child: Image.asset(
          'lib/assets/spinning_loading.png',
          fit: BoxFit.contain,
          alignment: Alignment.center,
          width: widget.size,
          height: widget.size,
        ),
      ),
    );
  }
}
