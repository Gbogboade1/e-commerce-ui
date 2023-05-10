import 'package:flutter/foundation.dart';

class BuildConfig {
  static const bool isDev = !kReleaseMode;
  static const bool showLogs = true && isDev;
}
