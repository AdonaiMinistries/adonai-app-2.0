import 'dart:math';

import 'package:flutter/material.dart';

class DeviceDetector {
  static String deviceType(MediaQueryData query) {
    var size = query.size;
    var diagonal =
        sqrt((size.width * size.width) + (size.height * size.height));

    print(diagonal);

    if (diagonal < 1000) {
      return "phone";
    }
    return "tv";
  }
}
