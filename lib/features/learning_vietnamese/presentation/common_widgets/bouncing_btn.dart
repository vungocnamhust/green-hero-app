import 'package:flutter/material.dart';

class BouncingButtonLV extends StatefulWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String text;
  final Function() onTap;

  BouncingButtonLV({
    this.backgroundColor = Colors.white,
    this.borderColor = Colors.black87,
    this.textColor = Colors.black87,
    this.text,
    this.onTap,
  });

  @override
  _BouncingButtonLVState createState() => _BouncingButtonLVState();
}

class _BouncingButtonLVState extends State<BouncingButtonLV> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  static const double thickness = 6;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: thickness,
      duration: Duration(milliseconds: 10),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) => _controller.forward(),
      onTapUp: (details) => _controller.reverse(),
      onTapCancel: () => _controller.reverse(),
      child: Container(
        height: 60,
        alignment: Alignment.bottomCenter,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              children: [
                SizedBox(
                  height: _controller.value,
                ),
                Material(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 16,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: widget.backgroundColor,
                      border: Border.all(
                        color: widget.borderColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: widget.borderColor,
                          offset: Offset(
                            0,
                            thickness - _controller.value,
                          ),
                        ),
                      ],
                    ),
                    child: Text(
                      widget.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
