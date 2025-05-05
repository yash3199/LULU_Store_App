import 'package:json_annotation/json_annotation.dart';
import 'article_details_entity.dart';
import 'return_entity.dart';

part 'article_response_entity.g.dart';

@JsonSerializable()
class ArticleResponseEntity {
  final ArticleDetailsEntity ArticleDetails;
  final ReturnEntity Return;

  ArticleResponseEntity({
    required this.ArticleDetails,
    required this.Return,
  });

  factory ArticleResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseEntityToJson(this);
}
