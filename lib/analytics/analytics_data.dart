import 'package:mooncake_analytics/models/export.dart';

/// Contains the analytics data extracted for Mooncake.
class AnalyticsData {
  final Map<User, UserData> _usersData;

  AnalyticsData({Map<User, UserData> data}) : _usersData = data ?? {};

  /// Returns the overall number of users
  int get usersCount => _usersData.length;

  /// Returns the overall number of posts
  int get postsCount => _usersData.values
      .map((userData) => userData.posts.length)
      .reduce((length1, length2) => length1 + length2);

  /// Returns the overall number of reactions
  int get reactionsCount => _usersData.values
      .map((userData) => userData.reactions.length)
      .reduce((length1, length2) => length1 + length2);

  /// Registers a new [post].
  void registerPost(Post post) {
    final data = _usersData[post.creator] ?? UserData.empty();
    _usersData[post.creator] = data.addPost(post);
  }

  /// Registers a new [reaction].
  void registerReaction(Reaction reaction) {
    final data = _usersData[reaction.user] ?? UserData.empty();
    _usersData[reaction.user] = data.addReaction(reaction);
  }

  /// Returns a new instance of [AnalyticsData] inside which the data
  /// have been sorted based on the activity of the user, from the
  /// top contributor to the least contributor.
  AnalyticsData sorted() {
    final entries = _usersData.entries.toList();
    entries.sort((data1, data2) {
      final compareValue = data1.value.compareTo(data2.value);
      return compareValue != 0 ? compareValue : data1.key.compareTo(data2.key);
    });
    return AnalyticsData(data: Map.fromEntries(entries));
  }

  Map<User, UserData> asMap() {
    return Map.fromEntries(_usersData.entries);
  }
}
