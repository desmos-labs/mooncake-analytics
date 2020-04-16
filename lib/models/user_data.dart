import 'package:mooncake_leaderboard/models/export.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

/// Represents the activity data of a single user.
class UserData extends Equatable implements Comparable<UserData> {
  /// List of posts that have been created from the user.
  final List<Post> posts;

  /// List of reactions that have been created from the user.
  final List<Reaction> reactions;

  int get contributionsNumber => posts.length + reactions.length;

  UserData({
    @required this.posts,
    @required this.reactions,
  })  : assert(posts != null),
        assert(reactions != null);

  factory UserData.empty() {
    return UserData(posts: [], reactions: []);
  }

  UserData addPost(Post post) {
    return UserData(posts: posts + [post], reactions: reactions);
  }

  UserData addReaction(Reaction reaction) {
    return UserData(reactions: reactions + [reaction], posts: posts);
  }

  @override
  List<Object> get props => [posts, reactions];

  @override
  int compareTo(UserData other) {
    return other.contributionsNumber.compareTo(contributionsNumber);
  }
}
