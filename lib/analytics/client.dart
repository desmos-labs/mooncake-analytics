import 'package:graphql/internal.dart';
import 'package:mooncake_leaderboard/export.dart';
import 'package:graphql/client.dart';
import 'package:meta/meta.dart';

class AnalyticsClient {
  final GraphQLClient _graphQLClient;

  AnalyticsClient({@required String gqlHost})
      : assert(gqlHost != null),
        _graphQLClient = GraphQLClient(
          link: WebSocketLink(url: gqlHost),
          cache: InMemoryCache(),
        );

  AnalyticsData _mapData(dynamic data) {
    final result = data['posts'];
    final posts = result.map((element) => Post.fromJson(element)).toList();

    final analytics = AnalyticsData();

    // Register the post and the reactions
    posts.forEach((post) {
      analytics.registerPost(post);
      post.reactions.forEach((react) => analytics.registerReaction(react));
    });

    return analytics.sorted();
  }

  Stream<AnalyticsData> getData() {
    final subspace =
        '2bdf5932925584b9a86470bea60adce69041608a447f84a3317723aa5678ec88';
    final query = '''
    subscription PostsSubscription {
      posts: post(where: {subspace: {_eq: "$subspace"}}) {
        user: creator {
          address
        }
        reactions {
          user: owner {
            address
          }
        }
      }
    }
    ''';

    return _graphQLClient
        .subscribe(Operation(document: query))
        .map((result) => _mapData(result.data));
  }
}
