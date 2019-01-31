import 'package:json_annotation/json_annotation.dart';

part 'MeiZhiDTO.g.dart';

@JsonSerializable()
class MeiZhiDTO {
  final bool error;
  final List<Item> results;

  MeiZhiDTO(this.error, this.results);

  factory MeiZhiDTO.fromJson(Map<String, dynamic> json) =>
      _$MeiZhiDTOFromJson(json);
}

@JsonSerializable()
class Item {
  final bool used;
  final String createdAt;
  final String desc;
  final String publishedAt;
  final String source;
  final String type;
  final String url;
  final String who;
  final List<String> images;

  Item(this.used, this.createdAt, this.desc, this.publishedAt, this.source,
      this.type, this.url, this.who, this.images);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}
