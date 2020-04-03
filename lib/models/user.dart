import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// Represents a single user inside Mooncake.
@JsonSerializable(explicitToJson: true)
class User extends Equatable implements Comparable<User> {
  /// Represents the address of the user
  @JsonKey(name: 'address')
  final String address;

  User({@required this.address}) : assert(required != null);

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserToJson(this);
  }

  @override
  List<Object> get props => [address];

  @override
  int compareTo(User other) {
    return address.compareTo(other.address);
  }
}
