import 'package:mooncake_analytics/models/export.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'post.g.dart';

/// Represents a single post
@JsonSerializable(explicitToJson: true)
class Post extends Equatable {
  /// Represents the creator of the post.
  @JsonKey(name: 'user')
  final User creator;

  /// Represents all the reactions that have been added to the post.
  @JsonKey(name: 'reactions')
  final List<Reaction> reactions;

  Post({
    @required this.creator,
    @required this.reactions,
  })  : assert(creator != null),
        assert(reactions != null);

  factory Post.fromJson(Map<String, dynamic> json) {
    return _$PostFromJson(json);
  }

  @override
  List<Object> get props => [creator, reactions];

  Map<String, dynamic> toJson() {
    return _$PostToJson(this);
  }
}
