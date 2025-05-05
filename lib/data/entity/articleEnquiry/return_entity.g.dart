// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'return_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReturnEntity _$ReturnEntityFromJson(Map<String, dynamic> json) => ReturnEntity(
      Type: json['Type'] as String,
      Code: json['Code'] as String,
      Message: json['Message'] as String,
    );

Map<String, dynamic> _$ReturnEntityToJson(ReturnEntity instance) =>
    <String, dynamic>{
      'Type': instance.Type,
      'Code': instance.Code,
      'Message': instance.Message,
    };
