

import 'package:json_annotation/json_annotation.dart';

part 'article_details_entity.g.dart';

@JsonSerializable()
class ArticleDetailsEntity {
  final String Material;
  final String Extmatlgrp;
  final String MatlDesc;

  // Include other fields if needed...

  ArticleDetailsEntity({
    required this.Material,
    required this.Extmatlgrp,
    required this.MatlDesc,
  });

  factory ArticleDetailsEntity.fromJson(Map<String, dynamic> json) =>
      _$ArticleDetailsEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDetailsEntityToJson(this);
}
