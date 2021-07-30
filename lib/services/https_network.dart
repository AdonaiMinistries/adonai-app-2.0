import 'dart:convert';
import 'dart:io';

import 'package:adonai_2/models/App_config.dart';
import 'package:adonai_2/models/Sermon_config.dart';
import 'package:adonai_2/models/Sermons.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class DataService {
  final String _baseUri = 'https://api.vimeo.com';

  String _uri = '/users/140653357/projects/4496867/videos';

  Future<List<Sermon>> getSermons(String token) async {
    try {
      List<Sermon> sermons = [];

      /* There can be multiple pages, so need to fetch in loop from network. */
      do {
        final Response response =
            await http.get(Uri.parse(_baseUri + _uri), headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        });

        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['data'];

        sermons = sermons..addAll(body.map((e) => Sermon.fromJson(e)).toList());

        if ((json['paging']['next']) == null) {
          return sermons;
        }

        _uri = json['paging']['next'];
      } while (true);
    } catch (e) {
      throw e;
    }
  }

  Future<SermonConfig> getSermonConfig(String vidId) async {
    final String _baseUrl = "player.vimeo.com";
    Map<String, String> headers = {
      HttpHeaders.authorizationHeader:
          'Bearer f146ca9760ce7e79c962f5acff471b19',
      HttpHeaders.contentTypeHeader: 'application/json'
    };
    Uri uri = Uri.https(_baseUrl, "/video/$vidId/config");
    try {
      Response response = await http.get(uri, headers: headers);
      final sermonConfig = SermonConfig.fromJson(jsonDecode(response.body));
      return sermonConfig;
    } catch (e) {
      throw e;
    }
  }

  Future<AppConfig> getFileFromServer() async{
    final String _baseUrl = 'www.adonaichurch.in';

    Uri uri = Uri.https(_baseUrl, '/app-config.json');

    try {
      Response resp = await http.get(uri);
      final appConfig = AppConfig.fromJson(jsonDecode(resp.body));
      return appConfig;
    } catch (e) {
      throw e;
    }
  }
}
