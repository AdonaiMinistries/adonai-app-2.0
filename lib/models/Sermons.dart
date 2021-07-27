class Sermon {
  final String url;
  final String title;
  final String description;
  final thumbnails;
  final tags;

  Sermon(
      {required this.tags,
      required this.url,
      required this.title,
      required this.thumbnails,
      required this.description});

  factory Sermon.fromJson(dynamic data) {
    List months = [
      "January",
      "Feburary",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];

    List<dynamic> tagList = data['tags'];
    var localTag = new Map();

    String type;

    tagList.forEach((element) {
      /* Checking if first char is of numeric type*/
      if ((element['name']).contains(RegExp(r'[0-9]'), 0)) {
        var data = months.where((month) =>
            (element['name']).toLowerCase().contains(month.toLowerCase()));

        if (data.isNotEmpty) {
          type = "date";
        } else {
          type = "id";
        }
      } else {
        type = "preacher";
      }

      localTag[type] = element['name'];
    });

    return Sermon(
        url: data['link'],
        title: data['name'],
        description: (data['description'] == null) ? '' : data['description'],
        thumbnails: (data['pictures']['sizes'])
            .map((e) => Thumbnails.fromJson(e))
            .toList(),
        tags: localTag);
  }
}

class Thumbnails {
  final int width;
  final int height;
  final String url;
  final String urlWithPlayButton;

  Thumbnails(
      {required this.width,
      required this.height,
      required this.url,
      required this.urlWithPlayButton});

  factory Thumbnails.fromJson(dynamic data) => Thumbnails(
      width: data['width'] as int,
      height: data['height'] as int,
      url: data['link'],
      urlWithPlayButton: data['link_with_play_button']);
}
