// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['id'] as String,
      title: json['title'] as String,
      shortDesc: json['shortDesc'] as String,
      desc: json['desc'] as String,
      imageUrl: json['imageUrl'] as String,
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'shortDesc': instance.shortDesc,
      'desc': instance.desc,
      'imageUrl': instance.imageUrl,
    };
