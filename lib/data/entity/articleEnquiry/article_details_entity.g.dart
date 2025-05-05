// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDetailsEntity _$ArticleDetailsEntityFromJson(
        Map<String, dynamic> json) =>
    ArticleDetailsEntity(
      Material: json['Material'] as String,
      Extmatlgrp: json['Extmatlgrp'] as String,
      MatlDesc: json['MatlDesc'] as String,
    );

Map<String, dynamic> _$ArticleDetailsEntityToJson(
        ArticleDetailsEntity instance) =>
    <String, dynamic>{
      'Material': instance.Material,
      'Extmatlgrp': instance.Extmatlgrp,
      'MatlDesc': instance.MatlDesc,
    };
