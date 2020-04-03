// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    creator: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    reactions: (json['reactions'] as List)
        ?.map((e) =>
            e == null ? null : Reaction.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'user': instance.creator?.toJson(),
      'reactions': instance.reactions?.map((e) => e?.toJson())?.toList(),
    };
