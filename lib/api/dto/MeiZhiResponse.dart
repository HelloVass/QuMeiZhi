class MeiZhiResponse {
  final String id;
  final bool used;
  final String createdAt;
  final String desc;
  final String publishedAt;
  final String source;
  final String type;
  final String url;
  final String who;
  final List<String> images;

  MeiZhiResponse(
      {this.id,
      this.used,
      this.createdAt,
      this.desc,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.who,
      this.images});

  MeiZhiResponse.fromJson(json)
      : id = json['id'],
        used = json['used'],
        createdAt = json['createdAt'],
        desc = json['desc'],
        publishedAt = json['publishedAt'],
        source = json['source'],
        type = json['type'],
        url = json['url'],
        who = json['who'],
        images = (json['images'] != null
            ? (json['images'] as List).map((v) => v.toString()).toList()
            : null);
}
