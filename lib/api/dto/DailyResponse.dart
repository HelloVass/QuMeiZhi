import 'package:flutter_meizhi/api/dto/MeiZhiResponse.dart';

class DailyResponse {
  final bool error;
  final List<String> category;
  final Result result;

  DailyResponse({this.error, this.category, this.result});

  DailyResponse.fromJson(json)
      : error = json['error'],
        category = (json['category'] as List).map((v) => v.toString()).toList(),
        result = Result.fromJson(json['results']);
}

class Result {
  final List<MeiZhiResponse> android;
  final List<MeiZhiResponse> iOS;
  final List<MeiZhiResponse> video;
  final List<MeiZhiResponse> resource;
  final List<MeiZhiResponse> fuli;

  Result({this.android, this.iOS, this.video, this.resource, this.fuli});

  Result.fromJson(json)
      : android = (json['Android'] as List)
            .map((v) => MeiZhiResponse.fromJson(v))
            .toList(),
        iOS = (json['iOS'] as List)
            .map((v) => MeiZhiResponse.fromJson(v))
            .toList(),
        video = (json['休息视频'] as List)
            .map((v) => MeiZhiResponse.fromJson(v))
            .toList(),
        resource = (json['拓展资源'] as List)
            .map((v) => MeiZhiResponse.fromJson(v))
            .toList(),
        fuli = (json['福利'] as List)
            .map((v) => MeiZhiResponse.fromJson(v))
            .toList();
}
