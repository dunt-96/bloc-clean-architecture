import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemNavigation extends StatefulWidget {
  const ItemNavigation({
    super.key,
    required this.iconPath,
    required this.title,
    required this.isSelected,
  });

  final String iconPath;
  final String title;
  final bool isSelected;

  @override
  State<ItemNavigation> createState() => _ItemNavigationState();
}

class _ItemNavigationState extends State<ItemNavigation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 1.1, end: 1.3)
        .chain(CurveTween(curve: Curves.ease))
        .animate(_controller)
      ..addListener(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSelected) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _svgIcon(
                  widget.iconPath,
                  color: widget.isSelected ? Colors.blue : Colors.grey,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.isSelected ? Colors.blue : Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _svgIcon(String url, {Color? color}) {
    return SvgPicture.asset(
      url,
      height: 21,
      width: 26,
      fit: BoxFit.contain,
      color: color,
    );
  }
}
