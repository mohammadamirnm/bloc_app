import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  final String id;
  final String title;
  final String shortDesc;
  final String desc;
  final String imageUrl;

  News({
    required this.id,
    required this.title,
    required this.shortDesc,
    required this.desc,
    required this.imageUrl,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
