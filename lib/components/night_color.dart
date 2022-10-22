import 'dart:async';

import 'package:flutter/material.dart';
import 'package:night_color/extensions/time_of_day_extension.dart';

/// Night Color adjusts the color temperature of your screen according to your surroundings.
class NightColor extends StatefulWidget {
  /// enabled: enable or disable the color temperature
  final bool enabled;

  /// color: color to apply
  final Color color;

  /// sunset: time of the sunset
  final TimeOfDay sunset;

  /// sunrise: time of the sunrise
  final TimeOfDay sunrise;

  /// curve: curve of the adjustments
  final Curve curve;

  /// timerDuration: period of alpha updates
  final Duration timerDuration;

  /// child: child to apply the night color
  final Widget child;

  NightColor({
    Key? key,
    this.enabled = true,
    this.color = const Color.fromRGBO(255, 167, 85, 1),
    this.sunset = const TimeOfDay(hour: 8, minute: 0),
    this.sunrise = const TimeOfDay(hour: 16, minute: 0),
    this.curve = Curves.easeInOutCubic,
    this.timerDuration = const Duration(minutes: 1),
    required this.child,
  })  : assert(sunset.compareTo(sunrise) == -1),
        super(key: key);

  @override
  createState() => _NightColorState();
}

class _NightColorState extends State<NightColor> {
  late double opacity;
  Timer? _timer;

  @override
  void initState() {
    _setOpacity();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant NightColor oldWidget) {
    if (oldWidget.enabled != widget.enabled) {
      _setOpacity();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        widget.color.withOpacity(opacity),
        BlendMode.darken,
      ),
      child: widget.child,
    );
  }

  _setOpacity() {
    if (widget.enabled) {
      opacity = _computeOpacity();
      _timer = Timer.periodic(widget.timerDuration, (timer) {
        setState(() {
          opacity = _computeOpacity();
        });
      });
    } else {
      opacity = 0;
      _timer?.cancel();
    }
  }

  double _computeOpacity() {
    final time = TimeOfDay.now();

    if (time.compareTo(widget.sunset) == 1 &&
        time.compareTo(widget.sunrise) == -1) {
      return 0;
    }

    var alpha = 0.0;
    if (time.compareTo(widget.sunset) < 1) {
      final totalMinutes = widget.sunset.minutesFromMidnight();
      alpha = (totalMinutes - ((time.hour * 60) + time.minute)) / totalMinutes;
    } else {
      final totalMinutes = widget.sunrise.minutesToMidnight();
      final fromMidnight = widget.sunrise.minutesFromMidnight();
      alpha = ((time.hour * 60) + time.minute - fromMidnight) / totalMinutes;
    }
    return widget.curve.transform(alpha);
  }
}
