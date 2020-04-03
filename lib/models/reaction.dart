import 'package:mooncake_analytics/models/export.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'reaction.g.dart';

/// Represents a single post reaction.
@JsonSerializable(explicitToJson: true)
class Reaction extends Equatable {
  /// Represents the user that has created this reaction.
  @JsonKey(name: 'user')
  final User user;

  Reaction({@required this.user}) : assert(user != null);

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return _$ReactionFromJson(json);
  }

  @override
  List<Object> get props => [user];

  Map<String, dynamic> toJson() {
    return _$ReactionToJson(this);
  }
}
