// To parse this JSON data, do
//
//     final sermonConfig = sermonConfigFromJson(jsonString);

import 'dart:convert';

SermonConfig sermonConfigFromJson(String str) =>
    SermonConfig.fromJson(json.decode(str));

String sermonConfigToJson(SermonConfig data) => json.encode(data.toJson());

class SermonConfig {
  SermonConfig({
    required this.cdnUrl,
    required this.vimeoApiUrl,
    required this.request,
    required this.view,
    required this.vimeoUrl,
  });

  String cdnUrl;
  String vimeoApiUrl;
  Request request;
  int view;
  String vimeoUrl;

  factory SermonConfig.fromJson(Map<String, dynamic> json) => SermonConfig(
        cdnUrl: json["cdn_url"],
        vimeoApiUrl: json["vimeo_api_url"],
        request: Request.fromJson(json["request"]),
        view: json["view"],
        vimeoUrl: json["vimeo_url"],
      );

  Map<String, dynamic> toJson() => {
        "cdn_url": cdnUrl,
        "vimeo_api_url": vimeoApiUrl,
        "request": request.toJson(),
        "view": view,
        "vimeo_url": vimeoUrl,
      };
}

class Request {
  Request({
    required this.files,
    required this.lang,
    required this.sentry,
    required this.abTests,
    required this.referrer,
    required this.cookieDomain,
    required this.timestamp,
    required this.gcDebug,
    required this.expires,
    required this.client,
    required this.currency,
    required this.session,
    required this.cookie,
    required this.build,
    required this.urls,
    required this.signature,
    required this.flags,
    required this.country,
    required this.fileCodecs,
  });

  Files files;
  String lang;
  Sentry sentry;
  AbTests abTests;
  dynamic referrer;
  String cookieDomain;
  int timestamp;
  GcDebug gcDebug;
  int expires;
  Client client;
  String currency;
  String session;
  Cookie cookie;
  Build build;
  Urls urls;
  String signature;
  Flags flags;
  String country;
  FileCodecs fileCodecs;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        files: Files.fromJson(json["files"]),
        lang: json["lang"],
        sentry: Sentry.fromJson(json["sentry"]),
        abTests: AbTests.fromJson(json["ab_tests"]),
        referrer: json["referrer"],
        cookieDomain: json["cookie_domain"],
        timestamp: json["timestamp"],
        gcDebug: GcDebug.fromJson(json["gc_debug"]),
        expires: json["expires"],
        client: Client.fromJson(json["client"]),
        currency: json["currency"],
        session: json["session"],
        cookie: Cookie.fromJson(json["cookie"]),
        build: Build.fromJson(json["build"]),
        urls: Urls.fromJson(json["urls"]),
        signature: json["signature"],
        flags: Flags.fromJson(json["flags"]),
        country: json["country"],
        fileCodecs: FileCodecs.fromJson(json["file_codecs"]),
      );

  Map<String, dynamic> toJson() => {
        "files": files.toJson(),
        "lang": lang,
        "sentry": sentry.toJson(),
        "ab_tests": abTests.toJson(),
        "referrer": referrer,
        "cookie_domain": cookieDomain,
        "timestamp": timestamp,
        "gc_debug": gcDebug.toJson(),
        "expires": expires,
        "client": client.toJson(),
        "currency": currency,
        "session": session,
        "cookie": cookie.toJson(),
        "build": build.toJson(),
        "urls": urls.toJson(),
        "signature": signature,
        "flags": flags.toJson(),
        "country": country,
        "file_codecs": fileCodecs.toJson(),
      };
}

class AbTests {
  AbTests({
    required this.chromecast,
    // required this.liveSwitch,
    required this.statsFresnel,
    required this.llhlsTimeout,
  });

  Chromecast chromecast;
  // Chromecast liveSwitch;
  Chromecast statsFresnel;
  Chromecast llhlsTimeout;

  factory AbTests.fromJson(Map<String, dynamic> json) => AbTests(
        chromecast: Chromecast.fromJson(json["chromecast"]),
        // liveSwitch: Chromecast.fromJson(json["live_switch"]),
        statsFresnel: Chromecast.fromJson(json["stats_fresnel"]),
        llhlsTimeout: Chromecast.fromJson(json["llhls_timeout"]),
      );

  Map<String, dynamic> toJson() => {
        "chromecast": chromecast.toJson(),
        // "live_switch": liveSwitch.toJson(),
        "stats_fresnel": statsFresnel.toJson(),
        "llhls_timeout": llhlsTimeout.toJson(),
      };
}

class Chromecast {
  Chromecast({
    required this.track,
    required this.data,
    required this.group,
  });

  bool track;
  Data data;
  bool group;

  factory Chromecast.fromJson(Map<String, dynamic> json) => Chromecast(
        track: json["track"],
        data: Data.fromJson(json["data"]),
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "track": track,
        "data": data.toJson(),
        "group": group,
      };
}

class Data {
  Data();

  factory Data.fromJson(Map<String, dynamic> json) => Data();

  Map<String, dynamic> toJson() => {};
}

class Build {
  Build({
    required this.backend,
    required this.js,
  });

  String backend;
  String js;

  factory Build.fromJson(Map<String, dynamic> json) => Build(
        backend: json["backend"],
        js: json["js"],
      );

  Map<String, dynamic> toJson() => {
        "backend": backend,
        "js": js,
      };
}

class Client {
  Client({
    required this.ip,
  });

  String ip;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        ip: json["ip"],
      );

  Map<String, dynamic> toJson() => {
        "ip": ip,
      };
}

class Cookie {
  Cookie({
    required this.scaling,
    required this.volume,
    required this.quality,
    required this.hd,
    required this.captions,
  });

  int scaling;
  double volume;
  dynamic quality;
  int hd;
  dynamic captions;

  factory Cookie.fromJson(Map<String, dynamic> json) => Cookie(
        scaling: json["scaling"],
        volume: json["volume"],
        quality: json["quality"],
        hd: json["hd"],
        captions: json["captions"],
      );

  Map<String, dynamic> toJson() => {
        "scaling": scaling,
        "volume": volume,
        "quality": quality,
        "hd": hd,
        "captions": captions,
      };
}

class FileCodecs {
  FileCodecs({
    required this.hevc,
    required this.av1,
    required this.avc,
  });

  Hevc hevc;
  List<dynamic> av1;
  List<String> avc;

  factory FileCodecs.fromJson(Map<String, dynamic> json) => FileCodecs(
        hevc: Hevc.fromJson(json["hevc"]),
        av1: List<dynamic>.from(json["av1"].map((x) => x)),
        avc: List<String>.from(json["avc"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hevc": hevc.toJson(),
        "av1": List<dynamic>.from(av1.map((x) => x)),
        "avc": List<dynamic>.from(avc.map((x) => x)),
      };
}

class Hevc {
  Hevc({
    required this.hdr,
    required this.sdr,
  });

  List<dynamic> hdr;
  List<dynamic> sdr;

  factory Hevc.fromJson(Map<String, dynamic> json) => Hevc(
        hdr: List<dynamic>.from(json["hdr"].map((x) => x)),
        sdr: List<dynamic>.from(json["sdr"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "hdr": List<dynamic>.from(hdr.map((x) => x)),
        "sdr": List<dynamic>.from(sdr.map((x) => x)),
      };
}

class Files {
  Files({
    required this.dash,
    required this.hls,
    required this.progressive,
  });

  Dash dash;
  Hls hls;
  List<Progressive> progressive;

  factory Files.fromJson(Map<String, dynamic> json) => Files(
        dash: Dash.fromJson(json["dash"]),
        hls: Hls.fromJson(json["hls"]),
        progressive: List<Progressive>.from(
            json["progressive"].map((x) => Progressive.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "dash": dash.toJson(),
        "hls": hls.toJson(),
        "progressive": List<dynamic>.from(progressive.map((x) => x.toJson())),
      };
}

class Dash {
  Dash({
    required this.separateAv,
    required this.streams,
    required this.cdns,
    required this.streamsAvc,
    required this.defaultCdn,
  });

  bool separateAv;
  List<Stream> streams;
  Cdns cdns;
  List<Stream> streamsAvc;
  String defaultCdn;

  factory Dash.fromJson(Map<String, dynamic> json) => Dash(
        separateAv: json["separate_av"],
        streams:
            List<Stream>.from(json["streams"].map((x) => Stream.fromJson(x))),
        cdns: Cdns.fromJson(json["cdns"]),
        streamsAvc: List<Stream>.from(
            json["streams_avc"].map((x) => Stream.fromJson(x))),
        defaultCdn: json["default_cdn"],
      );

  Map<String, dynamic> toJson() => {
        "separate_av": separateAv,
        "streams": List<dynamic>.from(streams.map((x) => x.toJson())),
        "cdns": cdns.toJson(),
        "streams_avc": List<dynamic>.from(streamsAvc.map((x) => x.toJson())),
        "default_cdn": defaultCdn,
      };
}

class Cdns {
  Cdns({
    required this.akfireInterconnectQuic,
    required this.fastlySkyfire,
  });

  AkfireInterconnectQuic akfireInterconnectQuic;
  AkfireInterconnectQuic fastlySkyfire;

  factory Cdns.fromJson(Map<String, dynamic> json) => Cdns(
        akfireInterconnectQuic:
            AkfireInterconnectQuic.fromJson(json["akfire_interconnect_quic"]),
        fastlySkyfire: AkfireInterconnectQuic.fromJson(json["fastly_skyfire"]),
      );

  Map<String, dynamic> toJson() => {
        "akfire_interconnect_quic": akfireInterconnectQuic.toJson(),
        "fastly_skyfire": fastlySkyfire.toJson(),
      };
}

class AkfireInterconnectQuic {
  AkfireInterconnectQuic({
    required this.url,
    required this.origin,
    required this.avcUrl,
  });

  String url;
  String origin;
  String avcUrl;

  factory AkfireInterconnectQuic.fromJson(Map<String, dynamic> json) =>
      AkfireInterconnectQuic(
        url: json["url"],
        origin: json["origin"],
        avcUrl: json["avc_url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "origin": origin,
        "avc_url": avcUrl,
      };
}

class Stream {
  Stream({
    required this.profile,
    required this.quality,
    required this.id,
    required this.fps,
  });

  dynamic profile;
  String quality;
  String id;
  int fps;

  factory Stream.fromJson(Map<String, dynamic> json) => Stream(
        profile: json["profile"],
        quality: json["quality"],
        id: json["id"],
        fps: json["fps"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile,
        "quality": quality,
        "id": id,
        "fps": fps,
      };
}

class Hls {
  Hls({
    required this.separateAv,
    required this.defaultCdn,
    required this.cdns,
  });

  bool separateAv;
  String defaultCdn;
  Cdns cdns;

  factory Hls.fromJson(Map<String, dynamic> json) => Hls(
        separateAv: json["separate_av"],
        defaultCdn: json["default_cdn"],
        cdns: Cdns.fromJson(json["cdns"]),
      );

  Map<String, dynamic> toJson() => {
        "separate_av": separateAv,
        "default_cdn": defaultCdn,
        "cdns": cdns.toJson(),
      };
}

class Progressive {
  Progressive({
    required this.profile,
    required this.width,
    required this.mime,
    required this.fps,
    required this.url,
    required this.cdn,
    required this.quality,
    required this.id,
    required this.origin,
    required this.height,
  });

  dynamic profile;
  int width;
  String mime;
  int fps;
  String url;
  String cdn;
  String quality;
  String id;
  String origin;
  int height;

  factory Progressive.fromJson(Map<String, dynamic> json) => Progressive(
        profile: json["profile"],
        width: json["width"],
        mime: json["mime"],
        fps: json["fps"],
        url: json["url"],
        cdn: json["cdn"],
        quality: json["quality"],
        id: json["id"],
        origin: json["origin"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "profile": profile,
        "width": width,
        "mime": mime,
        "fps": fps,
        "url": url,
        "cdn": cdn,
        "quality": quality,
        "id": id,
        "origin": origin,
        "height": height,
      };
}

class Flags {
  Flags({
    required this.dnt,
    required this.preloadVideo,
    required this.plays,
    required this.partials,
    required this.autohideControls,
  });

  int dnt;
  String preloadVideo;
  int plays;
  int partials;
  int autohideControls;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        dnt: json["dnt"],
        preloadVideo: json["preload_video"],
        plays: json["plays"],
        partials: json["partials"],
        autohideControls: json["autohide_controls"],
      );

  Map<String, dynamic> toJson() => {
        "dnt": dnt,
        "preload_video": preloadVideo,
        "plays": plays,
        "partials": partials,
        "autohide_controls": autohideControls,
      };
}

class GcDebug {
  GcDebug({
    required this.bucket,
  });

  String bucket;

  factory GcDebug.fromJson(Map<String, dynamic> json) => GcDebug(
        bucket: json["bucket"],
      );

  Map<String, dynamic> toJson() => {
        "bucket": bucket,
      };
}

class Sentry {
  Sentry({
    required this.url,
    required this.enabled,
    required this.debugEnabled,
    required this.debugIntent,
  });

  String url;
  bool enabled;
  bool debugEnabled;
  int debugIntent;

  factory Sentry.fromJson(Map<String, dynamic> json) => Sentry(
        url: json["url"],
        enabled: json["enabled"],
        debugEnabled: json["debug_enabled"],
        debugIntent: json["debug_intent"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "enabled": enabled,
        "debug_enabled": debugEnabled,
        "debug_intent": debugIntent,
      };
}

class Urls {
  Urls({
    required this.bareboneJs,
    required this.testImp,
    required this.jsBase,
    required this.fresnel,
    required this.js,
    required this.proxy,
    required this.muxUrl,
    required this.fresnelMimirInputsUrl,
    required this.fresnelChunkUrl,
    required this.threeJs,
    required this.vuidJs,
    required this.fresnelManifestUrl,
    required this.chromelessCss,
    required this.playerTelemetryUrl,
    required this.chromelessJs,
    required this.css,
  });

  String bareboneJs;
  String testImp;
  String jsBase;
  String fresnel;
  String js;
  String proxy;
  String muxUrl;
  String fresnelMimirInputsUrl;
  String fresnelChunkUrl;
  String threeJs;
  String vuidJs;
  String fresnelManifestUrl;
  String chromelessCss;
  String playerTelemetryUrl;
  String chromelessJs;
  String css;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        bareboneJs: json["barebone_js"],
        testImp: json["test_imp"],
        jsBase: json["js_base"],
        fresnel: json["fresnel"],
        js: json["js"],
        proxy: json["proxy"],
        muxUrl: json["mux_url"],
        fresnelMimirInputsUrl: json["fresnel_mimir_inputs_url"],
        fresnelChunkUrl: json["fresnel_chunk_url"],
        threeJs: json["three_js"],
        vuidJs: json["vuid_js"],
        fresnelManifestUrl: json["fresnel_manifest_url"],
        chromelessCss: json["chromeless_css"],
        playerTelemetryUrl: json["player_telemetry_url"],
        chromelessJs: json["chromeless_js"],
        css: json["css"],
      );

  Map<String, dynamic> toJson() => {
        "barebone_js": bareboneJs,
        "test_imp": testImp,
        "js_base": jsBase,
        "fresnel": fresnel,
        "js": js,
        "proxy": proxy,
        "mux_url": muxUrl,
        "fresnel_mimir_inputs_url": fresnelMimirInputsUrl,
        "fresnel_chunk_url": fresnelChunkUrl,
        "three_js": threeJs,
        "vuid_js": vuidJs,
        "fresnel_manifest_url": fresnelManifestUrl,
        "chromeless_css": chromelessCss,
        "player_telemetry_url": playerTelemetryUrl,
        "chromeless_js": chromelessJs,
        "css": css,
      };
}
