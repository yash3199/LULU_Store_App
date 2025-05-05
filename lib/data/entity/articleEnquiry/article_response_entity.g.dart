// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResponseEntity _$ArticleResponseEntityFromJson(
        Map<String, dynamic> json) =>
    ArticleResponseEntity(
      ArticleDetails: ArticleDetailsEntity.fromJson(
          json['ArticleDetails'] as Map<String, dynamic>),
      Return: ReturnEntity.fromJson(json['Return'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArticleResponseEntityToJson(
        ArticleResponseEntity instance) =>
    <String, dynamic>{
      'ArticleDetails': instance.ArticleDetails,
      'Return': instance.Return,
    };
