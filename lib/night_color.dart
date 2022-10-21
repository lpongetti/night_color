library night_color;

import 'dart:async';

import 'package:flutter/material.dart';

class NightColor extends StatefulWidget {
  final Widget child;

  const NightColor({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  createState() => _NightColorState();
}

class _NightColorState extends State<NightColor> {
  late double opacity;
  late Timer timer;

  @override
  void initState() {
    opacity = _computeOpacity();

    timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        opacity = _computeOpacity();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: AnimatedOpacity(
              duration: const Duration(seconds: 10),
              opacity: opacity,
              child: Container(
                color: Color.fromRGBO(255, 167, 85, opacity),
              )),
        ),
      ],
    );
  }

  double _computeOpacity() {
    final now = DateTime.now();
// DateTime.

    final seconds = (now.hour * 60 * 60) + (now.minute * 60);
    return 1;
  }
}
