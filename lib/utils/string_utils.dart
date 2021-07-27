  String getVidIdFromUrl(String vidUrl) {
    List<String> str = vidUrl.split('/');
    return str[str.length - 1];
  }