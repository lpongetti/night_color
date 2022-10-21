import 'package:flutter/material.dart';
import 'package:night_color/extensions/time_of_day_extension.dart';
import 'package:test/test.dart';

void main() {
  test('minutes from/to midnight', () {
    var time = const TimeOfDay(hour: 16, minute: 0);
    expect(time.minutesFromMidnight(), 960);
    expect(time.minutesToMidnight(), 480);

    time = const TimeOfDay(hour: 8, minute: 0);
    expect(time.minutesFromMidnight(), 480);
    expect(time.minutesToMidnight(), 960);

    time = const TimeOfDay(hour: 7, minute: 43);
    expect(time.minutesFromMidnight(), 463);
    expect(time.minutesToMidnight(), 977);
  });
}
