import 'package:adonai/models/Sermon_config.dart';

String getUrlByPixel(List<Progressive> videoList, String pixle) {
  String url = '';
  if (videoList.isEmpty) {
    return url;
  }
  /* Loop through the list and return the matching pixel. */
  videoList.forEach((element) {
    if (element.quality == pixle) {
      url = element.url;
    }
  });

  return url;
}
