import 'package:flutter/material.dart';

import '../resources/resources.dart';

class MyLoader extends StatefulWidget {
  final Color color;

  const MyLoader({super.key, this.color = Colors.red});

  @override
  MyLoaderState createState() => MyLoaderState();
}

class MyLoaderState extends State<MyLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800), // Heartbeat duration
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: R.appColors.primary.withValues(alpha: .075),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            // boxShadow: [BoxShadow(color: R.colors.white, spreadRadius: 3, blurRadius: 10)],
            borderRadius: BorderRadius.circular(7),
          ),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: AssetImage(R.appImages.logoDark)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
