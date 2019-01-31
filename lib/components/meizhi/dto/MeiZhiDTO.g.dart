// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MeiZhiDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeiZhiDTO _$MeiZhiDTOFromJson(Map<String, dynamic> json) {
  return MeiZhiDTO(
      json['error'] as bool,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Item.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$MeiZhiDTOToJson(MeiZhiDTO instance) =>
    <String, dynamic>{'error': instance.error, 'results': instance.results};

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
      json['used'] as bool,
      json['createdAt'] as String,
      json['desc'] as String,
      json['publishedAt'] as String,
      json['source'] as String,
      json['type'] as String,
      json['url'] as String,
      json['who'] as String,
      (json['images'] as List)?.map((e) => e as String)?.toList());
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'used': instance.used,
      'createdAt': instance.createdAt,
      'desc': instance.desc,
      'publishedAt': instance.publishedAt,
      'source': instance.source,
      'type': instance.type,
      'url': instance.url,
      'who': instance.who,
      'images': instance.images
    };
