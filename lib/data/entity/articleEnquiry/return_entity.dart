import 'package:json_annotation/json_annotation.dart';

part 'return_entity.g.dart';

@JsonSerializable()
class ReturnEntity {
  final String Type;
  final String Code;
  final String Message;

  ReturnEntity({
    required this.Type,
    required this.Code,
    required this.Message,
  });

  factory ReturnEntity.fromJson(Map<String, dynamic> json) =>
      _$ReturnEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnEntityToJson(this);
}
