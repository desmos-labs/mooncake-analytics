import 'dart:html';

import 'package:mooncake_leaderboard/export.dart';

void main() async {
  final loading = querySelector('#loading');
  final dataDiv = querySelector('#data');

  loading.text = 'Loading data...';

  // Get the data
  final url = 'wss://gql.morpheus.desmos.network/v1/graphql';
  final client = AnalyticsClient(gqlHost: url);
  client.getData().listen((data) {
    handleData(data);

    // Show the table and hide the loading data
    loading.style.display = 'none';
    dataDiv.style.visibility = 'visible';
  });
}

void handleData(AnalyticsData data) {
  // Build the table body
  final usersBody = (querySelector('#users') as TableSectionElement)
    ..children = [];
  data.asMap().forEach((user, data) {
    final row = usersBody.addRow();
    row.addCell()..text = user.address;
    row.addCell()..text = data.posts.length.toString();
    row.addCell()..text = data.reactions.length.toString();
    row.addCell()..text = data.contributionsNumber.toString();
  });

  // Show the statistics
  final statsBody = (querySelector('#statistics') as TableSectionElement)
    ..children = [];
  final usersRow = statsBody.addRow();
  usersRow.addCell()..text = 'Users';
  usersRow.addCell()..text = data.usersCount.toString();

  final postsRow = statsBody.addRow();
  postsRow.addCell()..text = 'Posts';
  postsRow.addCell()..text = data.postsCount.toString();

  final reactionsRow = statsBody.addRow();
  reactionsRow.addCell()..text = 'Reactions';
  reactionsRow.addCell()..text = data.reactionsCount.toString();
}
