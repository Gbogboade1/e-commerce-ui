import '../../__lib.dart';

void log(Object? data) {
  if (BuildConfig.showLogs) {
    debugPrint(data.toString());
  }
}
