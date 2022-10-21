import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }

  int minutesFromMidnight() {
    return (hour * 60) + minute;
  }

  int minutesToMidnight() {
    var result = 0;
    if (minute != 0) {
      result += 60 - minute;
    }
    result += (24 - (hour + (minute != 0 ? 1 : 0))) * 60;
    return result;
  }
}
