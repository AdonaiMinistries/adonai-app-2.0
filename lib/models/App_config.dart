// To parse this JSON data, do
//
//     final appConfig = appConfigFromJson(jsonString);

import 'dart:convert';

AppConfig appConfigFromJson(String str) => AppConfig.fromJson(json.decode(str));

String appConfigToJson(AppConfig data) => json.encode(data.toJson());

class AppConfig {
    AppConfig({
        required this.config,
    });

    Config config;

    factory AppConfig.fromJson(Map<String, dynamic> json) => AppConfig(
        config: Config.fromJson(json["config"]),
    );

    Map<String, dynamic> toJson() => {
        "config": config.toJson(),
    };
}

class Config {
    Config({
        required this.token,
        required this.stream,
    });

    String token;
    Stream stream;

    factory Config.fromJson(Map<String, dynamic> json) => Config(
        token: json["token"],
        stream: Stream.fromJson(json["stream"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "stream": stream.toJson(),
    };
}

class Stream {
    Stream({
        required this.link,
        required this.nextStream,
    });

    String link;
    String nextStream;

    factory Stream.fromJson(Map<String, dynamic> json) => Stream(
        link: json["link"],
        nextStream: json["nextStream"],
    );

    Map<String, dynamic> toJson() => {
        "link": link,
        "nextStream": nextStream,
    };
}
